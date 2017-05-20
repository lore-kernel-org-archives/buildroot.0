From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 May 2017 17:38:17 +0200
Subject: [Buildroot] [PATCH 1/1] flex: remove
 disable-flex-binary-and-doc patch.
In-Reply-To: <20170520151752.22320-1-Adamduskett@outlook.com>
References: <20170520151752.22320-1-Adamduskett@outlook.com>
Message-ID: <20170520173817.01107631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 11:17:52 -0400, Adam Duskett wrote:
> Currently the flex makefile blindly links flex++ to flex in
> host/usr/bin, but because of the patch
> 0001-flex-disable-flex-binary-and-documentation.patch, this binary no
> longer exists, so it's a invalid simlink to begin with.
> 
> Furthermore, host-checkpolicy requires host/usr/bin/flex to be present,
> and will fail with a "host/usr/bin/flex: Command not found" error.
> 
> The patch itself says:
> "Since we prevent the flex binary to be built, we also need to prevent
> the documentation to be built, otherwise it will fail"
> 
> Since the flex binary needs to be built, this patch is no longer necessary.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

There is indeed a bug in commit
e9a5f5843d0685c69b3c379b91bb9cce8864b8a2 in that it no longer
builds/installs the flex binary, for both the host and target variant.

We do want to build the flex binary when building host-flex (since it's
needed as a build dependency for other packages), but we do *NOT* want
to build the flex binary when building the target flex, because
building the flex binary is not possible on noMMU platforms.

Bottom line: e9a5f5843d0685c69b3c379b91bb9cce8864b8a2 is bogus, but
your patch is also bogus.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
