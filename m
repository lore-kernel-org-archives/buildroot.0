From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 07:48:23 +0200
Subject: [Buildroot] locale supports in buildroot (segment fault)
In-Reply-To: <20130822022639.GA6009@zuhnb712.ap.bm.net>
References: <20130822022639.GA6009@zuhnb712.ap.bm.net>
Message-ID: <5215A627.90607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 04:26, Woody Wu wrote:
> Hi,
>
> I want to build locale support for my local langauge. Then I enabled
> BR2_GENERATE_LOCALE="en_US zh_CN zh_CN.gbk".  In the progress of
> building (after post-build script), it begins to report errors:
>
> Generating locale en_US.en_US

  This is strange. It should generate locale for en_US.UTF-8 - the en_US 
charmap obviously doesn't exist.

  I see now - the cut command is missing a '-s' option. Patch follows.

> character map file `en_US' not found: No such file or directory
> /bin/sh: line 1:  7006 Segmentation fault
> I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
> /home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
> --prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
> "LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
> ${locale}
> Generating locale zh_CN.zh_CN
> character map file `zh_CN' not found: No such file or directory
> /bin/sh: line 1:  7041 Segmentation fault
> I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
> /home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
> --prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
> "LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
> ${locale}
> Generating locale zh_CN.gbk
> character map file `gbk' not found: No such file or directory

  Charmaps are always in capitals, so this should be GBK instead. Look in 
/usr/share/i18n/charmaps.


  Regards,
  Arnout

> /bin/sh: line 1:  7074 Segmentation fault
> I18NPATH=/home/woody/src/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/i18n:/usr/share/i18n
> /home/woody/src/buildroot-2013.05/output/host/usr/bin/localedef
> --prefix=/home/woody/src/buildroot-2013.05/output/target --`echo
> "LITTLE" | tr [A-Z] [a-z]`-endian -i ${inputfile} -f ${charmap}
> ${locale}
>
>
> How should I dod it correct?  Thanks.
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
