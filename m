From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 19:14:23 +0200
Subject: [Buildroot] [PATCH 0/2] Fix build problem of pulseaudio
Message-ID: <1368119665-917-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of two patches that fix the pulseaudio link problem. It
turns out that the problem was that json-c and libjson both install a
library with the same name, /usr/lib/libjson.so, even though they have
a different API and language. So, when libjson was built and installed
after json-c, it was overriding json-c libjson.so link with a link to
its own library, and Pulseaudio was failing to build.

The solution is to bump json-c to 0.11, which changes its name to
libjson-c.so, and apply an upstream pulseaudio patch that makes
pulseaudio use json-c instead of json when available.

Best regards,

Thomas

Thomas Petazzoni (2):
  json-c: bump to version 0.11
  pulseaudio: link against json-c

 ...n-c-add-missing-file-to-installed-headers.patch |   43 --------------------
 package/json-c/json-c-no-reentrant.patch           |   25 +++++++++---
 package/json-c/json-c.mk                           |    6 ++-
 .../pulseaudio-compat-with-json-c-0.11.patch       |   26 ++++++++++++
 package/multimedia/pulseaudio/pulseaudio.mk        |    6 +++
 5 files changed, 55 insertions(+), 51 deletions(-)
 delete mode 100644 package/json-c/json-c-add-missing-file-to-installed-headers.patch
 create mode 100644 package/multimedia/pulseaudio/pulseaudio-compat-with-json-c-0.11.patch

-- 
1.7.9.5
