From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 17:11:32 +0200
Subject: [Buildroot] [PATCH] libusb-compat: fix a build issue with
 undefined PATH_MAX
In-Reply-To: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
References: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
Message-ID: <8b198702-d118-0dc0-fe5b-7f56d5145c47@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bartosz,

On 03-07-17 16:16, Bartosz Golaszewski wrote:
> libsigrok build failed because of PATH_MAX not being defined in usb.h.
> On linux it is defined in linux/limits.h, but usb.h only includes
> limit.h. Add a patch fixing the header in libusb-compat.

 This doesn't sound right: according to POSIX [1], limits.h should define
PATH_MAX. And indeed, if you do

echo '#include <usb.h>' | host/usr/bin/x86_64-amd-linux-gnu-gcc -x c -E -

you'll see that PATH_MAX gets properly expanded to 4096. So something else is
going on.


> 
> While we're at it: remove the patch numbering from previous patch.

 Good idea, but no need to add your SoB just for that.

 Regards,
 Arnout

> Fixes: http://autobuild.buildroot.net/results/535/5353c2418c0c3311ef9ecb1f1ddc3ce769369b96/
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

[1] http://pubs.opengroup.org/onlinepubs/009695399/basedefs/limits.h.html

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
