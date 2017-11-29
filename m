From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:16:31 +0100
Subject: [Buildroot] [PATCH 1/2] rauc: select host-squashfs as a host
 dependency
In-Reply-To: <20171128032723.14081-1-yurovsky@gmail.com>
References: <20171128032723.14081-1-yurovsky@gmail.com>
Message-ID: <20171129221631.51e0fc70@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 19:27:22 -0800, Andrey Yurovsky wrote:
> The rauc host tool (used to generate update bundles) runs mksquashfs so
> host-squashfs is required for it to work at runtime.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/rauc/Config.in.host | 1 +
>  package/rauc/rauc.mk        | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

I've applied to master. Note however that it in fact doesn't really
solve the problem entirely, because $(HOST_DIR)/bin is not in the PATH,
so rauc still doesn't find mksquashfs:

$ ./output/host/bin/rauc --cert demo.cert.pem --key demo.key.pem bundle output/images/t/ test.raucb
input directory: output/images/t/
output bundle: test.raucb

(rauc:17776): rauc-WARNING **: failed to create bundle: Failed to start mksquashfs: Failed to execute child process ?mksquashfs? (No such file or directory)

But mksquashfs is in output/host/bin. Perhaps rauc should also try to
find mksquashfs from the same directory as rauc, before trying a
system-wide installed one?

Or we expect people to run "rauc bundle" from a post-image script, in
which case $(HOST_DIR)/bin is in the PATH ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
