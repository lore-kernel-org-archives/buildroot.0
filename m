From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 23:23:34 +0100
Subject: [Buildroot] i686-buildroot-linux-gnu-as  does not work
In-Reply-To: <1848702296.4768001.1390826907232.JavaMail.root@openwide.fr>
References: <1848702296.4768001.1390826907232.JavaMail.root@openwide.fr>
Message-ID: <52E6DC66.6040105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/14 13:48, Romain Naour wrote:
> I meant that usually in buildroot, Makefile's variables are overwritten in foo.mk
>
> I removed my patch and added AS="$(TARGET_CC) -c" in infozip.mk
>
> $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) AS="$(TARGET_CC) -c" -f unix/Makefile generic
>
> infozip compiles fine by doing that.

  Actually there's a deeper cause I'm afraid...

  The make command calls unix/configure to find out some things about the 
platform, but the configure script sets CPP to /usr/bin/cpp or /lib/cpp 
if either of these exist. But those host tools obviously have the wrong 
predefined symbols, so the configure script will test if it is possible 
to use assembly for the host, not for the target...

  I think there are two possible "right" solutions:

1. fix unix/configure;
2. bypass unix/configure by using the generic_gcc target instead.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
