From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 18:06:02 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: fix hash
In-Reply-To: <20180906214220.854-1-fontaine.fabrice@gmail.com>
References: <20180906214220.854-1-fontaine.fabrice@gmail.com>
Message-ID: <20181021180602.49182723@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 23:42:20 +0200, Fabrice Fontaine wrote:
> When bumping to version 6.7, hash was not updated
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/599920bc0a5821fd3fb0a028574a25a22e12430f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongoose/mongoose.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I marked this patch as Rejected, because it would break older Buildroot
releases. Indeed, all Buildroot releases since 2017.05 are using
Mongoose 6.7. They currently fail to download Mongoose from Github due
the hash mismatch, but they fall back to the Buildroot mirror
successfully.

If we update the hash, the Buildroot mirror will discard the current
6.7 tarball, and replace it with a new tarball having the new hash.
While this will make the new Buildroot releases happy it would break
older Buildroot releases, that would no longer be able to download
neither from Github nor from the Buildroot mirror.

So instead, we need to bump to a newer Mongoose version, so that we can
keep the old mongoose-6.7 tarball on the Buildroot mirror to keep old
Buildroot releases happy.

So I've applied the following changes instead:

951f15b16f6167f4205988e5dde4d13e2f560791 package/mongoose: bump to version 6.13
7e62211976e0b9ddfd05a11fb24c61ed8a9a4491 package/mongoose: add hash for license file
dea3ab68400503bebf4152277d63813508f43424 package/mongoose: add security patch fixing CVE-2018-10945

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
