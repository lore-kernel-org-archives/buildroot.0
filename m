From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 1 Apr 2020 13:29:40 -0300
Subject: [Buildroot] kmscube: cannot fetch from cgit.freedesktop.org
Message-ID: <CAOMZO5B2ox8cpL8rMGrqD=gDg7-PVyiV7T_ci_8zFfSFMSq-Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need to upgrade kmscube in Buildroot to the latest commit and this
is how I did it:

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index e306d0055e..06ec518d94 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 254d34209740731a557469030c960bbfd2299485a2ad0cbed2f7040b56a292a7
 kmscube-6cbd03ab94066dddbba7bedfde87c7c4319c18d5.tar.gz
+sha256 aa6f7300d6a7026dcb0c9a6dfaf417be82dc32a5abb338b5bfdfab7d8e90bc48
 kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 37983b1a78..a2974c1fa1 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################

-KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
+KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
 KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
-KMSCUBE_AUTORECONF = YES

-$(eval $(autotools-package))
+$(eval $(meson-package))

(kmscube has changed to meson, so that's why it was changed to meson-package.)

Here is the output:

$ make
>>> kmscube 4660a7dca6512b6e658759d00cff7d4ad2a2059d Downloading
--2020-04-01 13:26:03--
https://cgit.freedesktop.org/mesa/kmscube/snapshot/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
Resolving cgit.freedesktop.org (cgit.freedesktop.org)... 131.252.210.161
Connecting to cgit.freedesktop.org
(cgit.freedesktop.org)|131.252.210.161|:443... connected.
HTTP request sent, awaiting response... 400 Bad request
2020-04-01 13:26:04 ERROR 400: Bad request.

--2020-04-01 13:26:04--
http://sources.buildroot.net/kmscube/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::681a:125, 2606:4700:20::681a:25, 104.26.0.37, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::681a:125|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2020-04-01 13:26:04 ERROR 404: Not Found.

--2020-04-01 13:26:04--
http://sources.buildroot.net/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::681a:25, 2606:4700:20::681a:125, 104.26.1.37, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::681a:25|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2020-04-01 13:26:04 ERROR 404: Not Found.

package/pkg-generic.mk:167: recipe for target
'/home/fabio/buildroot/output/build/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d/.stamp_downloaded'
failed
make: *** [/home/fabio/buildroot/output/build/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d/.stamp_downloaded]
Error 1

I can retrieve a tar.gz manually if I do like this:

wget "https://gitlab.freedesktop.org/mesa/kmscube/repository/archive.tar.gz?ref=4660a7dca6512b6e658759d00cff7d4ad2a2059d"
-O archive.tar.gz

It seems that the current kmscube version only builds in Buildroot
because it is fetched from Buildroot's mirrror.

If I mirror the https://cgit.freedesktop.org/mesa/kmscube into my own
github, then I can make Buildroot to fetch it and build it.

Any comments/ideas as to how to fix this?

Thanks,

Fabio Estevam
