From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Sep 2016 10:05:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <20160903232302.40ff0733@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 3 Sep 2016 23:23:02 +0200")
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
 <20160903203613.2a7f0a32@free-electrons.com>
 <1496256.AqCB2eOqyL@sagittea>
 <20160903232302.40ff0733@free-electrons.com>
Message-ID: <87vayau5yt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > However, we could discuss whether it really makes sense to use
 >> > https:// as the main download location when all downloads anyway fall
 >> > back to downloading from sources.buildroot.net over http://.  
 >> 
 >> sources.buildroot.net should provide an https access?

 > I am not a security expert, I am not sure if this is really useful. I
 > don't think there's anything secret in those communications, and the
 > integrity of the downloaded tarballs is verified using hashes.

 > Maybe the solution to the whole problem is to use http:// when
 > available over https:// ? Though admittedly more and more sites tend to
 > redirect http to https and force people to use secure connections
 > (which is a good thing).

 > I'm open to suggestions from others on this.

Well, the problems we typically run into are:

- Websites using TLS with SNI (to not 'waste' an IP address per site),
  which isn't supported by old wget versions

- Websites signed with new certificates not known by older distributions

- Misconfigured websites or website using self signed certificates

The reason we have preferred https was to ensure data integrity
(E.G. make sure we get the correct tarball), not for privacy. With the
download hashes this doesn't really matter much, as corruption will be
discovered by the hashes.

I think our options are:

- Do nothing. The issue is not so big, and presumably will get smaller
  over time as older distributions get updated.

- Change HTTPS URLs to HTTP where possible. Notice that these days a
  number of websites use HSTS headers to enforce HTTPS. I'm not sure
  when HSTS support got added to wget though (not clear from changelog)

- Pass --no-check-certificate in BR2_WGET to disable the check, working
  around the issues.

What do you say?

-- 
Venlig hilsen,
Peter Korsgaard 
