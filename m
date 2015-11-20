From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:06:20 +0100
Subject: [Buildroot] Using openssl functions in another package
In-Reply-To: <564F7606.4020309@cmlab.biz>
References: <564F7606.4020309@cmlab.biz>
Message-ID: <564F995C.2000709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 20:35, David Van Arnem wrote:
> Hi all,
> 
> I have a custom package (source in C) that uses some of OpenSSL's SHA functions
> to perform hashing.  I can build successfully outside of the buildroot tree by
> both including the SHA header file in the C source with:
> 
> #include <openssl/sha.h>
> 
> and then adding the crypto library in the CC command:
> 
> $(CC) -lcrypto -o prog prog.c

 In general, instead of explicitly passing -lcrypto it is better to use
pkg-config to get the flags:

$(CC) `pkg-config --cflags libcrypto --libs libcrypto` -o prog prog.c

> 
> However, when I try to build the package in buildroot, using the same CC command
> in the Makefile, I get the following error:
> 
> prog.c: fatal error: openssl/sha.h: No such file or directory
> 
> I have enabled the openssl package in my buildroot configuration, and set up my
> custom package's Config.in to depend on it:
> 
> depends on BR2_PACKAGE_OPENSSL

 Did you also add a dependency on openssl in the package.mk file?  Do you pass
the correct CC in the package.mk file? Is the header properly installed in
output/staging/usr/include/openssl?

 Regards,
 Arnout

> 
> My target is a MicroBlaze (little endian, single core) processor.  What else
> might I need to do to use the OpenSSL SHA functions correctly and avoid this error?
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
