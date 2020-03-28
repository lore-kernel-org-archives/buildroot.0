From: iman ahmadvand <iman72411@gmail.com>
Date: Sat, 28 Mar 2020 11:39:46 +0430
Subject: [Buildroot] Failed to load libmmal.so from rpi-userland package via
 buildroot toolchain on raspberry pi 4
Message-ID: <CAPn7sn38WqJVgbLBkVj403GpkhcQx77HwdZ9zxEEvifO7qRbxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone.
It seems that loading the MMAL interface shared libraries from rpi-userland
package via simple dlopen is not possible, or more specific, the packages
or binaries such as VLC or VLC codec plugin (libavcodec_plugin) could not
load the libavcodec from FFmpeg which in turn depends on libmmal*.so

The steps to reproduce(with BR2_PACKAGE_RPI_USERLAND enabled,
BR2_STRIP_strip disabled, BR2_OPTIMIZE_0 enabled):
git clone git://git.busybox.net/buildroot buildroot && cd buildroot && git
checkout 2019.11.01
make raspberrypi4_defconfig && make all

Then in this image try to run a simple c routine with dlopen(), if you do
so, for example, ./dltest /usr/lib/libmmal.so you will end up with:

symbol 'mmal_port_payload_alloc': can't resolve symbol
symbol 'mmal_port_payload_free': can't resolve symbol
symbol 'mmal_port_log_category': can't resolve symbol

Or for another proof of the issue, you can run VLC with X11 to play an
MPEG-4 video, and you will  end up with VLC could not load the codec module
because of the same thing:

main debug: loading plugins cache file /usr/lib/vlc/plugins/plugins.dat
main warning: cannot read /usr/lib/vlc/plugins/plugins.dat: No such
file or directory
main debug: recursively browsing `/usr/lib/vlc/plugins'
main warning: cannot load module
`/usr/lib/vlc/plugins/codec/libavcodec_plugin.so' ((null)

Any idea about this?

Best Regards.
IMAN.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200328/edb4f076/attachment.html>
