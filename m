From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 31 Mar 2015 22:50:55 +0300
Subject: [Buildroot] [PATCH] batctl: fix musl builds
In-Reply-To: <20150330231056.503b3c3d@free-electrons.com>
References: <20150327170415.GA4890@vostro>
 <20150330231056.503b3c3d@free-electrons.com>
Message-ID: <20150331195055.GA2344@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Mar 30, 2015 at 11:10:56PM +0200, Thomas Petazzoni wrote:

> > diff --git a/package/batctl/0001-musl-netinet.patch b/package/batctl/0001-musl-netinet.patch
> 
> This patch is badly named: 0001-musl-netinet, while it also fixes
> things unrelated to netinet: the __be16/__be32 types. So either name it
> 0001-musl-fixes, or better maybe, split it in two patches.
Those are related changes actually. It looks like this:

linux/if_ether.h:
	struct ethhdr { ...  __be16 h_proto; }

netinet/if_ether.h (musl):
	struct ethhdr { ...  uint16_t h_proto; }

and that's where batctl code gets __be* types from if I got it right,
because it was written with linux/if_ether.h in mind.

Anyway, this is non-obvious and -musl-fixes.patch would work just as well,
so I'm sending v2 with the patch renamed.

> Also, can you submit the corresponding patches upstream?
No problem, patch sent upstream.
