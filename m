From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:13:40 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: delete debug libs when debug
 is not enabled
In-Reply-To: <20200714022554.2045-1-danomimanchego123@gmail.com>
References: <20200714022554.2045-1-danomimanchego123@gmail.com>
Message-ID: <20200714101340.186cbf90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 22:25:54 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> +ifneq ($(BR2_ENABLE_DEBUG),y)
> +	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
> +endif

The thing is that BR2_ENABLE_DEBUG=y doesn't mean you want debugging
symbols on the target, it means you want debugging symbols in staging.

So, I adjusted this to:

+ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
+       rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
+endif

As BR2_ENABLE_DEBUG=y + BR2_STRIP_strip disabled is the best indication
we have (I believe) to say "I want debugging symbols on the target".

Applied with that change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
