From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 18:32:51 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: allow for stupid toolchains
In-Reply-To: <54CFA351.2050408@openwide.fr>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <54CFA351.2050408@openwide.fr>
Message-ID: <20150202173251.GB17739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel, Romain, All,

On 2015-02-02 17:18 +0100, Romain Naour spake thusly:
> Le 22/01/2015 19:33, Ezequiel Garcia a ?crit :
> > From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > 
> > check_arm_abi builds a test C file to check that the toolchain is
> > working correctly, with the output redirected to /dev/null.
> > 
> > However, some toolchains (OSELAS 2013.12.2, for instance) foolishly
> > append ".gdb" to the output filename for an intermediate file, causing
> > an attempt to write to /dev/null.gdb, which obviously fails.
> > 
> > Fix this by adding an option to skip this check, so it can be selected
> > in the OSELAS toolchain.
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > ---
> >  toolchain/helpers.mk                   | 6 +++++-
> >  toolchain/toolchain-external/Config.in | 4 ++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 3121da4..d008a4f 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -297,13 +297,17 @@ check_arm_abi = \
> >  	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
> >  		echo "External toolchain uses the unsuported OABI" ; \
> >  		exit 1 ; \
> > -	fi ; \
> > +	fi
> > +
> > +ifneq ($(BR2_ARM_TOOLCHAIN_SKIP_CHECK),y)
> > +check_arm_abi += ; \
> >  	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
> >  		abistr_$(BR2_ARM_EABI)='EABI'; \
> >  		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
> >  		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
> >  		exit 1 ; \
> >  	fi
> > +endif
> >  
> 
> I looked at this issue and tried to avoid the use of /dev/null.gdb ...
> In the Cortex-M toolchain, it seems to have a wrapper around the linker like
> this one [1] which append the .gdb suffix.
> 
> However, there is no error if "-Wl,-r" (Generate relocatable output) is added in
> the gcc's command line but it's not really nice solution because this option
> will be there for other toolchains.
> 
> Yann proposed to use $BUILD_DIR/br-foo instead of /dev/null and add a comment
> why we do that.

Yeah, something like the following:

    diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
    index 3121da4..44696c0 100644
    --- a/toolchain/helpers.mk
    +++ b/toolchain/helpers.mk
    @@ -298,12 +298,14 @@ check_arm_abi = \
                echo "External toolchain uses the unsuported OABI" ; \
                exit 1 ; \
        fi ; \
    -   if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
    +   if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-temp-out - ; then \
    +           rm -f $(BUILD_DIR)/.br-temp-out*; \
                abistr_$(BR2_ARM_EABI)='EABI'; \
                abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
                echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
                exit 1 ; \
    -   fi
    +   fi; \
    +   rm -f $(BUILD_DIR)/.br-temp-out*

     #
     # Check that the external toolchain supports C++

(does not apply, copy-paste with tab-brokenness)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
