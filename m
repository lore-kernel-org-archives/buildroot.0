From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 23:29:52 +0200
Subject: [Buildroot] [git commit] package/python-rpi-gpio: fix gcc-10
 compatibility patch
Message-ID: <20200823212253.3FAC68214E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae6bd1eb44bcf886de7ff412aba23c2e9b8c372e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the patch makes the package build OK, it fails at runtime
when the module is imported, because of missing symbols:

    ImportError: /usr/lib/python3.8/site-packages/RPi/_GPIO.cpython-38-aarch64-linux-gnu.so: undefined symbol: high

Fix that by making sure the symbols are declared once, but only once.

Fixes: #13166

Reported-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Fischer <mf@go-sys.de>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Ian Haylock <haylocki@yahoo.co.uk>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-build-with-gcc-10.x.patch             | 66 ++++++++++++++++------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch b/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch
index 7c7b772894..95892f997f 100644
--- a/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch
+++ b/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch
@@ -2,6 +2,19 @@ Description: This patch fixes the "multiple definition of" errors with gcc10
 
 Signed-off-by: Michael Fischer <mf@go-sys.de>
 
+diff -purN python-rpi-gpio.org/source/common.c python-rpi-gpio/source/common.c
+--- python-rpi-gpio.org/source/common.c	2019-07-21 14:41:22.000000000 +0200
++++ python-rpi-gpio/source/common.c	2020-08-07 09:31:33.948575964 +0200
+@@ -28,6 +28,9 @@
+ const int pin_to_gpio_rev1[41] = {-1, -1, -1, 0, -1, 1, -1, 4, 14, -1, 15, 17, 18, 21, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
+ const int pin_to_gpio_rev2[41] = {-1, -1, -1, 2, -1, 3, -1, 4, 14, -1, 15, 17, 18, 27, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
+ const int pin_to_gpio_rev3[41] = {-1, -1, -1, 2, -1, 3, -1, 4, 14, -1, 15, 17, 18, 27, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, 5, -1, 6, 12, 13, -1, 19, 16, 26, 20, -1, 21 };
++const int (*pin_to_gpio)[41];
++int gpio_direction[54];
++rpi_info rpiinfo;
+ int setup_error = 0;
+ int module_setup = 0;
+ 
 diff -purN python-rpi-gpio.org/source/common.h python-rpi-gpio/source/common.h
 --- python-rpi-gpio.org/source/common.h	2019-07-21 14:41:22.000000000 +0200
 +++ python-rpi-gpio/source/common.h	2020-08-07 09:31:33.948575964 +0200
@@ -29,10 +42,21 @@ diff -purN python-rpi-gpio.org/source/common.h python-rpi-gpio/source/common.h
 +extern int module_setup;
  int check_gpio_priv(void);
  int get_gpio_number(int channel, unsigned int *gpio);
+diff -purN python-rpi-gpio.org/source/constants.c python-rpi-gpio/source/constants.c
+--- python-rpi-gpio.org/source/constants.c	2019-07-21 14:41:22.000000000 +0200
++++ python-rpi-gpio/source/constants.c	2020-08-07 09:32:15.522196618 +0200
+@@ -21,6 +21,7 @@
+ */
+ 
+ #include "Python.h"
++#define CONSTANTS_C
+ #include "constants.h"
+ #include "common.h"
+ #include "c_gpio.h"
 diff -purN python-rpi-gpio.org/source/constants.h python-rpi-gpio/source/constants.h
 --- python-rpi-gpio.org/source/constants.h	2019-07-21 14:41:22.000000000 +0200
 +++ python-rpi-gpio/source/constants.h	2020-08-07 09:32:15.522196618 +0200
-@@ -23,22 +23,22 @@ SOFTWARE.
+@@ -23,22 +23,28 @@ SOFTWARE.
  #define PY_PUD_CONST_OFFSET 20
  #define PY_EVENT_CONST_OFFSET 30
  
@@ -53,23 +77,29 @@ diff -purN python-rpi-gpio.org/source/constants.h python-rpi-gpio/source/constan
 -PyObject *rising_edge;
 -PyObject *falling_edge;
 -PyObject *both_edge;
-+extern PyObject *high;
-+extern PyObject *low;
-+extern PyObject *input;
-+extern PyObject *output;
-+extern PyObject *pwm;
-+extern PyObject *serial;
-+extern PyObject *i2c;
-+extern PyObject *spi;
-+extern PyObject *unknown;
-+extern PyObject *board;
-+extern PyObject *bcm;
-+extern PyObject *pud_off;
-+extern PyObject *pud_up;
-+extern PyObject *pud_down;
-+extern PyObject *rising_edge;
-+extern PyObject *falling_edge;
-+extern PyObject *both_edge;
++#ifdef CONSTANTS_C
++#define MAYBE_EXTERN
++#else
++#define MAYBE_EXTERN extern
++#endif
++
++MAYBE_EXTERN PyObject *high;
++MAYBE_EXTERN PyObject *low;
++MAYBE_EXTERN PyObject *input;
++MAYBE_EXTERN PyObject *output;
++MAYBE_EXTERN PyObject *pwm;
++MAYBE_EXTERN PyObject *serial;
++MAYBE_EXTERN PyObject *i2c;
++MAYBE_EXTERN PyObject *spi;
++MAYBE_EXTERN PyObject *unknown;
++MAYBE_EXTERN PyObject *board;
++MAYBE_EXTERN PyObject *bcm;
++MAYBE_EXTERN PyObject *pud_off;
++MAYBE_EXTERN PyObject *pud_up;
++MAYBE_EXTERN PyObject *pud_down;
++MAYBE_EXTERN PyObject *rising_edge;
++MAYBE_EXTERN PyObject *falling_edge;
++MAYBE_EXTERN PyObject *both_edge;
  
  void define_constants(PyObject *module);
 diff -purN python-rpi-gpio.org/source/event_gpio.c python-rpi-gpio/source/event_gpio.c
