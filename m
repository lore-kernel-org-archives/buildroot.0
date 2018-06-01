From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 16:36:02 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/binutils: Cortex-M targets
 require version <2.29
In-Reply-To: <1527772887-31616-3-git-send-email-christophe.priouzeau@st.com>
 (Christophe PRIOUZEAU's message of "Thu, 31 May 2018 13:21:33 +0000")
References: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
 <1527772887-31616-3-git-send-email-christophe.priouzeau@st.com>
Message-ID: <87muwezi99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christophe" == Christophe PRIOUZEAU <christophe.priouzeau@st.com> writes:

 > From: Laurent GONZALEZ <br22@gezedo.com>
 > binutils 2.29 changed the implementation of adr pseudo instruction
 > it breaks linux kernel and impacts Cortex-M targets (eg. stm32)

 > Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
 > Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
 > ---
 >  package/binutils/Config.in.host | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
 > index 03b2281..9a4caad 100644
 > --- a/package/binutils/Config.in.host
 > +++ b/package/binutils/Config.in.host
 > @@ -2,8 +2,9 @@ comment "Binutils Options"
 
 >  choice
 >  	prompt "Binutils Version"
 > -	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 > -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 > +	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
 > +	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc && !BR2_ARM_CPU_ARMV7M
 > +	default BR2_BINUTILS_VERSION_ARC if BR2_arc && !BR2_ARM_CPU_ARMV7M

kconfig will use the first available default line, so it is enough to
simply add:

default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M

In front of the others. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
