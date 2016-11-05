From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 4 Nov 2016 22:47:49 -0200
Subject: [Buildroot] [PATCH] makedevs: unlink device nodes before they
	are created
In-Reply-To: <20161105001452.7252-1-arnout@mind.be>
References: <20161105001452.7252-1-arnout@mind.be>
Message-ID: <CAOMZO5CBGEy29UzMqrgOsFE6Vk=wb=UBkR_ShdpsPYMNhL0M2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Nov 4, 2016 at 10:14 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> We use makedevs to create device nodes in the target rootfs. However,
> this can be called several times, e.g. when building several filesystem
> images or when rebuilding. When the script is called the second time,
> the device node already exists so mknod() errors out.
>
> This wasn't noticed before because fakeroot's mknod() wrapper
> (incorrectly) does _not_ error out when the file exists already. Now
> we switched from fakeroot to pseudo, the problem becomes apparent.
>
> The simplest solution is to change makedevs to first remove the target
> file before creating it. This is simpler than two alternative
> approaches:
>
> - Removing the target files before makedevs is called is difficult,
>   because we would have to parse the device table file to find out
>   which files have to be deleted.
>
> - Silently skipping device creation if it exists already is also easy,
>   but then we really should also check if the device numbers and mode
>   are correct, and that is more complicated.
>
> The other types don't have to be changed. The 'd' (directory) type is
> already OK because it already only creates directories if they don't
> exist yet. The 'f' (file mode) and 'r' (recursive) types only operate
> on files and directories that exist already.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: Fabio Estevam <festevam@gmail.com>

This fixes the warp7_defconfig build error, thanks!

Tested-by: Fabio Estevam <festevam@gmail.com>
