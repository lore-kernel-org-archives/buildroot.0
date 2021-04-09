From: Arthur Lambert <lambertarthur22@gmail.com>
Date: Fri, 9 Apr 2021 09:53:23 +0200
Subject: [Buildroot] issue with timer_create and openblas after update
 buildroot from 2019_02 to 2021_02
In-Reply-To: <20210409005919.56690265@gmx.net>
References: <CAGpqJgqZBG5qMZDaS59syis2y1rm53f1KMWYzJKiwepHcJbadA@mail.gmail.com>
 <20210409005919.56690265@gmx.net>
Message-ID: <CAGpqJgrWmKs+XvNOa4qo6TukXfrDe1+aqs+M4R0wUuToNfVvLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to fix the issue by checking the Openblas history commits. But I
don't really understand the issue...

The issue is coming from here:
https://github.com/buildroot/buildroot/commit/6f29cdeee40e556d26b791fabaff84a09e1a2d5d#diff-0995e357753caee10bbc553c2e7aa033d1df05c0c9799916729d4881d7735d26

By default, the multithreading setting is enabled on Openblas. This setting
is really confusing me. For me, I have to enable the multithreading setting
to use Openblas
in a multithreading context (this is my case !). But it is the opposite!
There is this information in the Openblas USAGE file :

>> #### How can I use OpenBLAS in multi-threaded applications?
>>
>> If your application is already multi-threaded, it will conflict with
OpenBLAS
>> multi-threading. Thus, you must set OpenBLAS to use single thread in any
of the
>> following ways:
>>
>> * `export OPENBLAS_NUM_THREADS=1` in the environment variables.
>> * Call `openblas_set_num_threads(1)` in the application on runtime.
>> * Build OpenBLAS single thread version, e.g. `make USE_THREAD=0`

So I have to add this in my defconfig to build Openblas with
singlethread support to fix the problem:

iff --git a/configs/xxxx_defconfig b/configs/dxxxxxx_defconfig
index 4714080d7e..a760627e2c 100644
--- a/configs/xxxxx_defconfig
+++ b/configs/xxxx_defconfig
@@ -45,6 +45,7 @@ BR2_PACKAGE_PAHO_MQTT_C=y
 BR2_PACKAGE_ELFUTILS=y
 BR2_PACKAGE_LIBUNWIND=y
 BR2_PACKAGE_OPENBLAS=y
+# BR2_PACKAGE_OPENBLAS_USE_THREAD is not set
 BR2_PACKAGE_PROTOBUF=y
 BR2_PACKAGE_PROTOBUF_C=y
 BR2_PACKAGE_HAVEGED=y

How this "conflict" can cause an error on the timer_create feature from
uclibc?
Is my change correct?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210409/ed9ba3df/attachment.html>
