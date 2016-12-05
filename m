From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:29:52 +0100
Subject: [Buildroot] [PATCH 1/1] tftpd: make installation of tftp client
 optional
In-Reply-To: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8E8F554@ly-ex-02.thrane.tt.ad>
References: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8E8F554@ly-ex-02.thrane.tt.ad>
Message-ID: <20161205222952.1ae0c4ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 09:23:19 +0000, Nielsen, David Marqvar wrote:
> Signed-off-by: David Marqvar <david.nielsen@cobham.com>
> ---
>  package/tftpd/Config.in |  8 ++++++++
>  package/tftpd/tftpd.mk  | 11 ++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)

Your commit log is empty, so I'm not sure what you're trying to do
here. If I understand correctly, you want a sub-option to
enable/disable the installation of the "tftp" binary, so that you can
have a configuration where:

 - tftpd is the one coming from the tftpd package

 - tftp remains the one provided by Busybox

However, in Buildroot, we try to avoid having one sub-option per binary
program. We do have that in a few packages, and it's often very painful
and annoying to maintain. If you really, really don't like the tftp
program from the tftpd package, you can also add in your post-build
script:

	rm /usr/bin/tftp
	ln -s /bin/busybox /usr/bin/tftp

But I just checked and the tftp program installed by the tftp package
is only 22 KB in size:

thomas at skate:~/projets/buildroot (master)$ ls -l output/target/usr/bin/tftp 
-rwxr-xr-x 1 thomas thomas 22252 d?c.   5 22:24 output/target/usr/bin/tftp

So I really don't think it's worth the effort having yet another
sub-option for 22 KB, especially when you can handle such tweaking in
your post-build script if you really really want to.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
