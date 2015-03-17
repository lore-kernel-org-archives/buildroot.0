From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 09:18:01 -0300
Subject: [Buildroot] [PATCH 01/15] toolchain/helpers: add mandatory
 check for uclibc toolchain options
In-Reply-To: <20150314221850.GF4009@free.fr>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-2-git-send-email-gustavo@zacarias.com.ar>
 <20150314221850.GF4009@free.fr>
Message-ID: <55081B79.5040603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2015 07:18 PM, Yann E. MORIN wrote:

> Gustavo, All,
> 
> On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
>> Take 'm' as parameter in $2 (buildroot option name) in
>> check_uclibc_feature to indicate that a toolchain option is mandatory,
>> and bail out with an appropiate message if that's the case.
> 
> I had a hard time figuring out what you were doing here...
> 
> What about:
> 
>     toolchain/helpers: add check for mandatory uClibc options
> 
>     We currently only check that the Buildroot configuration matches
>     what is available in the toolchain.
> 
>     Since we're going to remove the check for LFS and make it a
>     mandatory feature, we will lose the corresponding Buildroot
>     option, so we won't be able to use check_uclibc_feature as-is.
> 
>     Introduce a special, magic value passed as the Buildroot option
>     name to recognise checks for mandatory uClibc options that do not
>     have a corresponding option in Buldroot.
> 
>     If the Buildroot option name is 'm', then the check is against
>     a mandatory uClibc option.
> 
>     If a mandatory uClibc option is missing, we reject the toolchain
>     as being unusable by Buildroot.
> 
> However, I don't think 'm' is the most appropriate. That's what somehow
> confused me: wtf are we concerned about tristates? What about making
> the check against an empty Buildroot option name, instead? No Buildroot
> option name means there's no correlation to be made, and hence is a
> mandatory uClibc option...

Actually i used 'm' as shortcut for 'mandatory', it's purely casual that
it matches tristate.
Initially i was going to duplicate functionality (make another function)
for mandatory toolchain options, used like:

$(call
check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU
support) ;\

(original)

$(call
check_uclibc_feature_mandatory,__UCLIBC_HAS_LFS__,$${UCLIBC_CONFIG_FILE},Large
file support) ;\

I'm not a big friend of magical strings but decided to throw the 'm' and
see what other said.
Still, i'd prefer the extra function for clarity.
Regards.
