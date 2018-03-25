From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:25:19 +0200
Subject: [Buildroot] [PATCH] sam-ba: use correct host arch binary for
 sam-ba symlink
In-Reply-To: <1521735866-15288-1-git-send-email-joshua.henderson@microchip.com>
References: <1521735866-15288-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180325222519.2d36d2f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joshua,

On Thu, 22 Mar 2018 09:24:26 -0700, Joshua Henderson wrote:
> Make the symlink created in the host/bin directory point to the right host arch
> binary.  This takes into account using the 32 bit or 64 bit binary.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  package/sam-ba/sam-ba.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

In fact, your commit does much more than fixing the sam-ba symlink
depending on the host architecture: the sam-ba symlink was *always*
broken. Indeed, you're changing this:

-	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
+	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba

I.e you're removing one level of ../ when creating the relative
symlink. And this is needed since we moved $(HOST_DIR)/usr to
$(HOST_DIR).

So even on a x86 32 bit system, where the binary is named "sam-ba",
your commit fixes the symbolic link. I've reworded the commit log
accordingly, and applied your patch. Thanks!

Peter: this commit qualifies for 2018.02.x.

Joshua: what about updating to 2.17, or even Sam-ba 3.x ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
