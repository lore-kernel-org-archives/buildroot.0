From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 5 Nov 2016 13:04:08 -0200
Subject: [Buildroot] [PATCH 2/2] makedevs: make device node creation
	idempotent
In-Reply-To: <20161105133812.18485-2-arnout@mind.be>
References: <20161105133812.18485-1-arnout@mind.be>
 <20161105133812.18485-2-arnout@mind.be>
Message-ID: <CAOMZO5A1DNKX2Wnf=BHd8wBiKfUmU1mp86WFR_96bWOGFyc5pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Nov 5, 2016 at 11:38 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> We use makedevs to create device nodes in the target rootfs. However,
> this can be called several times, e.g. when building several filesystem
> images or when rebuilding. When makedevs is called the second time, the
> device node already exists so mknod() errors out.
>
> This wasn't noticed before because fakeroot's mknod() wrapper
> (incorrectly) does _not_ error out when the file exists already. Now
> we switched from fakeroot to pseudo, the problem becomes apparent.
>
> Before creating the device node, check if it already exists and if so,
> if it has the correct device type and number. Change of mode and
> ownership is still done.
>
> This approach was preferred over removing the target files before
> creating them, which would be simpler. However, when e.g. a file exists
> as a normal file and makedevs specifies it as a device node, that
> really is an error so we should detect it.
>
> The other types don't have to be changed. The 'd' (directory) type is
> already OK because it already only creates directories if they don't
> exist yet. The 'f' (file mode) and 'r' (recursive) types only operate
> on files and directories that exist already.
>
> Patch also sent upstream to busybox.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: Fabio Estevam <festevam@gmail.com>

This fixes the build error I was seeing, thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>
