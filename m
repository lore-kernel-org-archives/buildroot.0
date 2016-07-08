From: Christian Stewart <christian@paral.in>
Date: Fri, 08 Jul 2016 19:55:59 +0000
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <20160708215031.17fe15de@free-electrons.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
 <20160708212753.55d3c2ae@free-electrons.com>
 <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
 <20160708215031.17fe15de@free-electrons.com>
Message-ID: <1468007759371-ab3cc5cc-18ef6641-3fcef03d@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Fri, Jul 8, 2016 12:50 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:OK. Can we remove unconditionally, or should we still keep it for

BR2_STATIC_LIBS=y builds?




Perhaps we should pass -extldflags '$(TARGET_LDFLAGS)', since

TARGET_LDFLAGS will automatically contain -static when

BR2_STATIC_LIBS=y.




That should be fine since extldflags is, I believe, only passed to C related
linkers.
For the specific case of runc, is ?RUNC_GOTAGS = static_build? needed

when BR2_STATIC_LIBS=y ?



That go tag is related to linking Go related code? In the runc code with a quick
grep I see only one inconsequential place it's actually referenced:

Godeps/_workspace/src/github.com/godbus/dbus/homedir_dynamic.go:// +build
!static_build Godeps/_workspace/src/github.com/godbus/dbus/homedir_static.go:// +build
static_build
And in that code I cannot even see the logic between the differences in the two
files, as far as I can tell when doing a static build it just looks up the
current home dir of the user, when doing a dynamic build it does some complex
/etc/passwd checking or the like. Absolutely nonsensical.
I'd just leave the static_build tag in there unconditionally, as it seems to
have little to no effect anyway, and turning it off will actually result in some
more complex and unnecessary home directory detection code being activated.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160708/70ff0c4e/attachment.html>
