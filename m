From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 02:08:29 +0100
Subject: [Buildroot] Looking for Pointers and Info: Active Directory &
 Kerberos
In-Reply-To: <1999F91E-39BA-444C-8B2B-61719E2B5EC6@exablox.com>
References: <CAKduhSuPAxx8m9O2GdgG_J9pSNii-pKwQe_663imJS3y9bd+tA@mail.gmail.com>
 <1999F91E-39BA-444C-8B2B-61719E2B5EC6@exablox.com>
Message-ID: <bba146b7-1691-db60-2b43-7661f8bb1b9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

On 08-11-16 00:22, Charles Hardin wrote:
> We hacked this in as an external package in our layout a bit ago - just one of
> those I was going to push
> up but never quite got around to it. We use this to link in kerberos.
> 

 Just for the heck of it I started implementing the krb5 package in parallel
with this mail, and I adapted it slightly based on what you wrote here (I copied
the help text and added the WARN_CFLAGS). Can you have a look and add Tested-by
and/or Reviewed-by tags?

 Regards,
 Arnout


> 
> 
> Config.in
> -----------
> config BR2_PACKAGE_KRB5
> bool "krb5"
> depends on BR2_TOOLCHAIN_HAS_THREADS
> help
>   KRB5 is the MIT Kerberos Version 5 implementation
> 
>   Kerberos is a network authentication protocol. It is designed
>   to provide strong authentication for client/server applications
>   by using secret-key cryptography. A free implementation of this
>   protocol is available from the Massachusetts Institute of Technology.
> 
>   http://web.mit.edu/Kerberos
> 
> comment "krb5 needs a toolchain w/ threads"
> depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> 
> 
> krb5.hash
> -----------
> sha256 cedb07fad8331e3ff2983d26e977a2ddba622f379c2b19bfea85bd695930f9e9 
> krb5-1.14.tar.gz
> 
> 
> 
> krb5.mk
> -----------
> ################################################################################
> #
> # krb5
> #
> ################################################################################
> 
> KRB5_VERSION = 1.14
> KRB5_SOURCE = krb5-$(KRB5_VERSION).tar.gz
> KRB5_SITE = http://web.mit.edu/Kerberos/dist/krb5/$(KRB5_VERSION)
> KRB5_LICENSE = MIT
> KRB5_LICENSE_FILES = NOTICE
> KRB5_INSTALL_STAGING = YES
> KRB5_INSTALL_TARGET = YES
> KRB5_DEPENDENCIES =
> KRB5_SUBDIR = src
> 
> # Pass some configuration variables into the environment
> KRB5_CONF_ENV += \
> ac_cv_func_regcomp=yes \
> ac_cv_printf_positional=yes \
> krb5_cv_attr_constructor_destructor=yes,yes \
> WARN_CFLAGS='-Wall' \
> 
> KRB5_CONF_OPTS += \
> --enable-thread-support \
> 
> $(eval $(autotools-package))
> 
> 
> 
>> On Nov 7, 2016, at 3:15 PM, Daniel Price <daniel.price@gmail.com
>> <mailto:daniel.price@gmail.com>> wrote:
>>
>>
>> Hi everyone,
>>
>> Our team is looking to integrate Active Directory client support into our
>> buildroot-based appliance.  To do so we think we need a working kerberos client.
>>
>> We are ultimately trying to get a working pam-krb5 module
>> (https://www.eyrie.org/~eagle/software/pam-krb5/); it depends on either
>> Heimdal or MIT Kerberos.
>>
>> So, we are struggling to work out the right stack to use, and trying to work
>> out whether anyone else has paved the way already.  Because of the existing
>> host-heimdal recipe, we spent some time trying to get a cross-build of Heimdal
>> to work.  However we recently noticed that Debian seems to be on the cusp of
>> removing its support for Heimdal
>> (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837728).  And we had
>> trouble getting the pam-krb5 module to see heimdal at all.
>>
>> Has anyone else worked through this?  Has anyone else got MIT kerberos up and
>> running?  Pointers much appreciated.
>>
>>       -dp
>>
>> -- 
>> Daniel.Price at gmail.com <mailto:Daniel.Price@gmail.com>; Twitter: @danielbprice
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
