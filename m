From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Sep 2009 14:56:28 +0200
Subject: [Buildroot] [PATCH] iptables: fix disable-ipv6 option
In-Reply-To: <1253447642-25865-1-git-send-email-razzor@kopf-tisch.de> (Olaf
	Rempel's message of "Sun\, 20 Sep 2009 13\:54\:02 +0200")
References: <1253447642-25865-1-git-send-email-razzor@kopf-tisch.de>
Message-ID: <87ocp5wz9f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 Olaf> - bumb version to v1.4.5
 Olaf> - add fix for --disable-ipv6 option
 Olaf>   (upstream bug: http://bugzilla.netfilter.org/show_bug.cgi?id=608)

 Olaf> Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
 Olaf> ---
 Olaf>  package/iptables/iptables-1.4.5-disable-ipv6.patch |   19 +++++++++++++++++++
 Olaf>  package/iptables/iptables.mk                       |    2 +-
 Olaf>  2 files changed, 20 insertions(+), 1 deletions(-)
 Olaf>  create mode 100644 package/iptables/iptables-1.4.5-disable-ipv6.patch

 Olaf> diff --git a/package/iptables/iptables-1.4.5-disable-ipv6.patch b/package/iptables/iptables-1.4.5-disable-ipv6.patch
 Olaf> new file mode 100644
 Olaf> index 0000000..9f22a0c
 Olaf> --- /dev/null
 Olaf> +++ b/package/iptables/iptables-1.4.5-disable-ipv6.patch
 Olaf> @@ -0,0 +1,19 @@
 Olaf> +--- iptables-1.4.5/xtables.c.org	2009-09-14 18:36:55.000000000 +0200
 Olaf> ++++ iptables-1.4.5/xtables.c	2009-09-20 13:24:11.000000000 +0200
 Olaf> +@@ -1484,6 +1484,7 @@
 Olaf> + xtables_ip6parse_multiple(const char *name, struct in6_addr **addrpp,
 Olaf> + 		      struct in6_addr **maskpp, unsigned int *naddrs)
 Olaf> + {
 Olaf> ++	static const struct in6_addr zero_addr;
 Olaf> + 	struct in6_addr *addrp;
 Olaf> + 	char buf[256], *p;
 Olaf> + 	unsigned int len, i, j, n, count = 1;
 Olaf> +@@ -1526,7 +1527,7 @@
 Olaf> + 		memcpy(*maskpp + i, addrp, sizeof(*addrp));
 Olaf> + 
 Olaf> + 		/* if a null mask is given, the name is ignored, like in "any/0" */
 Olaf> +-		if (memcmp(*maskpp + i, &in6addr_any, sizeof(in6addr_any)) == 0)
 Olaf> ++		if (memcmp(*maskpp + i, &zero_addr, sizeof(zero_addr)) == 0)
 Olaf> + 			strcpy(buf, "::");
 Olaf> + 
 Olaf> + 		addrp = ip6parse_hostnetwork(buf, &n);

Using struct in6_addr on a pure ipv4 system doesn't look that clean to
me, but as it obviously works:

Committed, thanks.

-- 
Bye, Peter Korsgaard
