From: Michael Fischer <mf@go-sys.de>
Date: Fri, 7 Aug 2020 10:17:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: fix build with gcc
 10.x
Message-ID: <20200807081727.17947-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...hon-rpi-gpio-fix-build-with-gcc-10.x.patch | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch

diff --git a/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch b/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch
new file mode 100644
index 0000000000..961b8b398a
--- /dev/null
+++ b/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch
@@ -0,0 +1,113 @@
+diff -Naur a/source/common.h b/source/common.h
+--- a/source/common.h	2019-07-21 14:41:22.000000000 +0200
++++ b/source/common.h	2020-08-07 09:31:33.948575964 +0200
+@@ -30,14 +30,14 @@
+ #define I2C          42
+ #define PWM          43
+ 
+-int gpio_mode;
+-const int pin_to_gpio_rev1[41];
+-const int pin_to_gpio_rev2[41];
+-const int pin_to_gpio_rev3[41];
+-const int (*pin_to_gpio)[41];
+-int gpio_direction[54];
+-rpi_info rpiinfo;
+-int setup_error;
+-int module_setup;
++extern int gpio_mode;
++extern const int pin_to_gpio_rev1[41];
++extern const int pin_to_gpio_rev2[41];
++extern const int pin_to_gpio_rev3[41];
++extern const int (*pin_to_gpio)[41];
++extern int gpio_direction[54];
++extern rpi_info rpiinfo;
++extern int setup_error;
++extern int module_setup;
+ int check_gpio_priv(void);
+ int get_gpio_number(int channel, unsigned int *gpio);
+diff -Naur a/source/constants.h b/source/constants.h
+--- a/source/constants.h	2019-07-21 14:41:22.000000000 +0200
++++ b/source/constants.h	2020-08-07 09:32:15.522196618 +0200
+@@ -23,22 +23,22 @@
+ #define PY_PUD_CONST_OFFSET 20
+ #define PY_EVENT_CONST_OFFSET 30
+ 
+-PyObject *high;
+-PyObject *low;
+-PyObject *input;
+-PyObject *output;
+-PyObject *pwm;
+-PyObject *serial;
+-PyObject *i2c;
+-PyObject *spi;
+-PyObject *unknown;
+-PyObject *board;
+-PyObject *bcm;
+-PyObject *pud_off;
+-PyObject *pud_up;
+-PyObject *pud_down;
+-PyObject *rising_edge;
+-PyObject *falling_edge;
+-PyObject *both_edge;
++extern PyObject *high;
++extern PyObject *low;
++extern PyObject *input;
++extern PyObject *output;
++extern PyObject *pwm;
++extern PyObject *serial;
++extern PyObject *i2c;
++extern PyObject *spi;
++extern PyObject *unknown;
++extern PyObject *board;
++extern PyObject *bcm;
++extern PyObject *pud_off;
++extern PyObject *pud_up;
++extern PyObject *pud_down;
++extern PyObject *rising_edge;
++extern PyObject *falling_edge;
++extern PyObject *both_edge;
+ 
+ void define_constants(PyObject *module);
+diff -Naur a/source/event_gpio.c b/source/event_gpio.c
+--- a/source/event_gpio.c	2019-07-21 14:41:22.000000000 +0200
++++ b/source/event_gpio.c	2020-08-07 09:42:05.564483136 +0200
+@@ -57,7 +57,7 @@
+ };
+ struct callback *callbacks = NULL;
+ 
+-pthread_t threads;
++static pthread_t threads;
+ int event_occurred[54] = { 0 };
+ int thread_running = 0;
+ int epfd_thread = -1;
+diff -Naur a/source/py_pwm.h b/source/py_pwm.h
+--- a/source/py_pwm.h	2019-07-21 14:41:22.000000000 +0200
++++ b/source/py_pwm.h	2020-08-07 09:38:49.445646807 +0200
+@@ -20,5 +20,5 @@
+ SOFTWARE.
+ */
+ 
+-PyTypeObject PWMType;
++extern PyTypeObject PWMType;
+ PyTypeObject *PWM_init_PWMType(void);
+diff -Naur a/source/soft_pwm.c b/source/soft_pwm.c
+--- a/source/soft_pwm.c	2019-07-21 14:41:22.000000000 +0200
++++ b/source/soft_pwm.c	2020-08-07 09:42:40.753160437 +0200
+@@ -25,7 +25,7 @@
+ #include <time.h>
+ #include "c_gpio.h"
+ #include "soft_pwm.h"
+-pthread_t threads;
++static pthread_t threads;
+ 
+ struct pwm
+ {
+diff -Naur a/source/soft_pwm.h b/source/soft_pwm.h
+--- a/source/soft_pwm.h	2019-07-21 14:41:22.000000000 +0200
++++ b/source/soft_pwm.h	2020-08-07 09:39:25.916811352 +0200
+@@ -26,4 +26,4 @@
+ void pwm_set_frequency(unsigned int gpio, float freq);
+ void pwm_start(unsigned int gpio);
+ void pwm_stop(unsigned int gpio);
+-int pwm_exists(unsigned int gpio);
++extern int pwm_exists(unsigned int gpio);
-- 
2.28.0
