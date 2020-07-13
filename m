From: Aaron Sierra <asierra@xes-inc.com>
Date: Mon, 13 Jul 2020 13:47:49 -0500
Subject: [Buildroot] [PATCH RESEND 0/2] Use bzip2 for X11 PFC font
 compression
Message-ID: <20200713184751.23534-1-asierra@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gzip has been used as the default compressor for PCF fonts, but this
series changes the default compressor to bzip2 for a few reasons:

1. Even with the latest gzip, these seemingly synonymous pipelines
   produce different output, but this issue does not exist with bzip2:

  $ cat /path/to/file | gzip > /path/to/file.gz
  $ gzip < /path/to/file > /path/to/file.gz

2. Prior to gzip 1.10, the compression pipeline used with PCF fonts was
   not reproducible due to the implicit -N/--name injecting a timestamp:

  * cat /path/to/file | gzip > /path/to/file.gz

3. The BR2_USE_WCHAR dependency of the gzip package tarnishes the appeal
   of using host-gzip to provide reproducible output.

After building all PCF fonts under package/x11r7, the bzipped output is
slightly smaller:

  gzip  - 42392 KB
  bzip2 - 40500 KB

This change does not affect encodings, which will continue to be
gzipped. The upstream sources don't support bzip2 compression and their
compression pipeline happens to be reproducible before gzip 1.10:

* gzip < /path/to/file > /path/to/file.gz

-Aaron

Aaron Sierra (2):
  package/x11r7/xapp_mkfontscale: support bzip2
  package/x11r7/xfont_font-*: make outputs reproducible

 package/x11r7/xapp_mkfontscale/Config.in                    | 1 +
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk          | 6 ++++--
 .../xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk      | 1 +
 .../x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk  | 1 +
 .../xfont_font-adobe-utopia-100dpi.mk                       | 1 +
 .../xfont_font-adobe-utopia-75dpi.mk                        | 1 +
 .../x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk  | 1 +
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk  | 1 +
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk    | 1 +
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                | 1 +
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                 | 1 +
 .../xfont_font-bitstream-100dpi.mk                          | 1 +
 .../xfont_font-bitstream-75dpi.mk                           | 1 +
 .../xfont_font-cronyx-cyrillic.mk                           | 1 +
 .../x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk  | 1 +
 .../x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk  | 1 +
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk    | 1 +
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk  | 1 +
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk    | 1 +
 .../x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk    | 1 +
 .../xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk    | 1 +
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk  | 1 +
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk  | 1 +
 .../xfont_font-schumacher-misc.mk                           | 1 +
 .../xfont_font-screen-cyrillic.mk                           | 1 +
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk  | 1 +
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk    | 1 +
 .../xfont_font-winitzki-cyrillic.mk                         | 1 +
 28 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.1
