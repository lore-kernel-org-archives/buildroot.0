From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:13 +0100
Subject: [Buildroot] [PATCH v3 00/17] Split fftw into multiple packages
Message-ID: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a respin of Gwenhael patch series, after Yann and myself did a
review. We found enough things to fix/improve that posting a new
iteration makes sense.

Changes since v2:

 - Bisectability has been fixed. With Gwenhael patch series, the
   bisectability was not fully preserved accross the entire patch
   series. Indeed, Gwenhael was dropping the fftw package as soon as
   PATCH 4 of his series, before all users have been
   converted. Instead in this series, we keep the fftw package as a
   compatibility thing until the end of the series. Also, Gwenhael
   series was switching the BR2_PACKAGE_FFTW_PRECISION_* options
   legacy in the first patches of the series, even if they are still
   used by fftw users. We now do that at the end of the series, when
   dropping the fftw package.

 - Use DL_SUBDIR to avoid downloading the FFTW source code for each of
   the fftw subpackages.

 - Add a preparation patch that tweaks package/fftw/fftw.mk to clearly
   identify the parts that will be common to all fftw subpackages (and
   therefore will stay in fftw.mk) from the parts specific to each
   fftw variant.

 - Improve the commit logs and titles of the various commits.

 - Add a patch that drops support for fftw-double and fftw-long-double
   from liquid-dsp, since liquid-dsp cannot use any of these.

Since the patch series has been changed significantly, I have not kept
the Reviewed-by/Tested-by from Joel Carlson.

Best regards,

Thomas

Gwenhael Goavec-Merou (14):
  package/fftw: break fftw-single into a dedicated package
  package/fftw: break fftw-long-double into a dedicated package
  package/fftw: break fftw-quad into a dedicated package
  package/fftw: break fftw-double into a dedicated package
  package/alsa-utils: use the new fftw-single package
  package/aubio: use the new fftw-double and fftw-single packages
  package/gnuradio: use the new fftw-single package
  package/gqrx: remove unneeded fftw dependency
  package/hackrf: use the new fftw-single package
  package/httping: use the new fftw-double package
  package/imagemagick: use the new fftw-double package
  package/libvips: use the new fftw-double package
  package/pulseaudio: use the new fftw-single package
  package/liquid-dsp: use the new fftw-{single,double,long-double}
    packages

Thomas Petazzoni (3):
  package/fftw: prepare for splitting into multiple packages
  package/fftw: remove as regular package
  package/liquid-dsp: drop support for fftw-double and fftw-long-double

 Config.in.legacy                              | 36 +++++++++++++
 package/alsa-utils/alsa-utils.mk              |  2 +-
 package/aubio/aubio.mk                        | 13 +++--
 package/fftw/Config.in                        | 53 ++-----------------
 package/fftw/fftw-double/Config.in            |  5 ++
 package/fftw/fftw-double/fftw-double.hash     |  1 +
 package/fftw/fftw-double/fftw-double.mk       | 22 ++++++++
 package/fftw/fftw-long-double/Config.in       |  8 +++
 .../fftw-long-double/fftw-long-double.hash    |  1 +
 .../fftw/fftw-long-double/fftw-long-double.mk | 22 ++++++++
 package/fftw/fftw-quad/Config.in              |  7 +++
 package/fftw/fftw-quad/fftw-quad.hash         |  1 +
 package/fftw/fftw-quad/fftw-quad.mk           | 22 ++++++++
 package/fftw/fftw-single/Config.in            |  5 ++
 package/fftw/fftw-single/fftw-single.hash     |  1 +
 package/fftw/fftw-single/fftw-single.mk       | 37 +++++++++++++
 package/fftw/fftw.mk                          | 33 ++++--------
 package/gnuradio/Config.in                    |  8 +--
 package/gnuradio/gnuradio.mk                  |  2 +-
 package/gqrx/Config.in                        |  6 +--
 package/hackrf/Config.in                      |  6 +--
 package/hackrf/hackrf.mk                      |  2 +-
 package/httping/httping.mk                    |  4 +-
 package/imagemagick/imagemagick.mk            |  4 +-
 package/libvips/libvips.mk                    |  4 +-
 package/liquid-dsp/liquid-dsp.mk              | 14 +----
 package/pulseaudio/pulseaudio.mk              |  2 +-
 27 files changed, 206 insertions(+), 115 deletions(-)
 create mode 100644 package/fftw/fftw-double/Config.in
 create mode 120000 package/fftw/fftw-double/fftw-double.hash
 create mode 100644 package/fftw/fftw-double/fftw-double.mk
 create mode 100644 package/fftw/fftw-long-double/Config.in
 create mode 120000 package/fftw/fftw-long-double/fftw-long-double.hash
 create mode 100644 package/fftw/fftw-long-double/fftw-long-double.mk
 create mode 100644 package/fftw/fftw-quad/Config.in
 create mode 120000 package/fftw/fftw-quad/fftw-quad.hash
 create mode 100644 package/fftw/fftw-quad/fftw-quad.mk
 create mode 100644 package/fftw/fftw-single/Config.in
 create mode 120000 package/fftw/fftw-single/fftw-single.hash
 create mode 100644 package/fftw/fftw-single/fftw-single.mk

-- 
2.20.1
