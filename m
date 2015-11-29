From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 18:58:59 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
 installation
In-Reply-To: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151129185859.3fa69ae8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri,  6 Nov 2015 20:15:30 +0100, Yann E. MORIN wrote:
> Some packages misbehave, and install files in either of;
>   - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
>   - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).
> 
> One common reason for that is that pkgconf now prepends the sysroot path
> to all the paths it returns. Other reasons vary, but are mostly due to
> poorly writen generic-packages.
> 
> Add a check for those locations, as part of the command blocks for the
> target and staging installs.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Romain Naour <romain.naour@openwide.fr>

On my side, I am not supper happy with the additional complexity added
to the generic package infrastructure (yet again 19 lines added to
pkg-generic.mk, to verify for a very specific type of failure).

Could we instead use TARGET_FINALIZE_HOOKS for this check (yes it means
you wouldn't know which package has installed the files, but it's
generally trivial to find from the name/path of the installed files) ?

Or alternatively, use the existing instrumentation hooks.

And then, regardless of the solution being used, put this stuff in a
new .mk file (whose name shall be determined) which would ultimately
contain the implementation of other sanity checks (for example the
sanity check that all binaries are built for the correct target
architecture).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
