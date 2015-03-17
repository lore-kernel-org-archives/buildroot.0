From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 11:13:10 -0300
Subject: [Buildroot] [PATCH 01/15] toolchain/helpers: add mandatory
 check for uclibc toolchain options
In-Reply-To: <20150314221850.GF4009@free.fr>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-2-git-send-email-gustavo@zacarias.com.ar>
 <20150314221850.GF4009@free.fr>
Message-ID: <55083676.6040000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/2015 07:18 PM, Yann E. MORIN wrote:

>>  check_uclibc_feature = \
>>  	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
>> +	if [ "$(2)" = "m" -a "$${IS_IN_LIBC}" != "y" ] ; then \
> 
> With my proposal, that'd read:
> 
>     if [ -z "$(2)" -a "$${IS_IN_LIBC}" != "y" ] ; then \
> 
> Otherwise, code looks good. :-)
> 
> Regards,
> Yann E. MORIN.

Actually there's another scenario here, truth table!
If mandatory is true and the function is in libc the flow will go on,
hence doing the two other checks.
Problem is if parameter $2 is != 'y' and IS_IN_LIBC = 'y' then we've got
a problem (external toolchain with largefile and uclibc for example). So
resulting in:

-----
if [ -z "$(2)" ] ; then \
  if [ "$${IS_IN_LIBC}" != "y" ] ; then \
    echo "$(4) not available in C library, toolchain unsuitable for
Buildroot" ;
    exit 1 ; \
  fi ; \
else \
  if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
    echo "$(4) available in C library, please enable $(2)" ; \
    exit 1 ; \
  fi ; \
  if [ "$($(2))" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
    echo "$(4) not available in C library, please disable $(2)" ; \
    exit 1 ; \
  fi ; \
fi
-----

Happens for not testing an uclibc lfs-enabled external toolchain :)
Regards.
