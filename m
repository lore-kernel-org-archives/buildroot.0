From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 22:25:25 +0100
Subject: [Buildroot] UPX - compression of fs at target
In-Reply-To: <1575365532631-0.post@n4.nabble.com>
References: <1575365532631-0.post@n4.nabble.com>
Message-ID: <be085da4-f44a-c565-27b5-6a60ce1cf091@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 10:32, a wrote:
> HI, 
> How can I make use of UPX so that the final image, that buildroot builds,
> has libraries that are compresses even further by upx before creating the
> image so that the image size get reduced further.

 I guess you could write a post-build script that runs upx on all executable
files in ${TARGET_DIR}/bin and  ${TARGET_DIR}/usr/bin.

 To get good results, I expect you need to combine it with BR2_STATIC_LIBS.
Otherwise a large fraction of the total size will be in shared libraries instead
of executables, and I don't think those can be compressed. And then, you'd
probably also want to globally enable LTO - but Buildroot doesn't have good
support for that at this time.

 I expect that the net benefit will be limited though. You're going to be better
off with a rootfs that is compressed at the filesystem level, e.g. squashfs or
ubifs.

 Regards,
 Arnout
