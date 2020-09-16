From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 11:29:56 +0200
Subject: [Buildroot] [PATCH v2] package/{bandwithd, dhcpcd, htpdate,
 minidlna, nginx, nss-pam-ldapd,
 openvmtools}: use PIDFile=/run in systemd services
In-Reply-To: <20200916084536.094c5b17@windsurf.hq.k.grp>
References: <20200915194958.658-1-buildroot@heine.tech>
 <20200915215645.2010-1-buildroot@heine.tech>
 <20200916084536.094c5b17@windsurf.hq.k.grp>
Message-ID: <ec5cb887-efd6-d87f-9303-61d3a6a85919@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 16.09.2020 08:45, Thomas Petazzoni wrote:
> Hello,
> 

> I think we would normally prefer one patch for each. For example, for
> htpdate, we also need to fix the PIDFile path so that it has a .pid
> extension.

okay, i'll split that up.
> 
> Also, is there something that needs to be done with Postgresql:
> 
> package/postgresql/postgresql.service:PIDFile=/var/lib/pgsql/postmaster.pid
> 
> is it expected to have the PIDFile in /var/lib ?

I'm not sure where the initial .service file came from. The postgres
manual doesn't use PIDFile as it has a Type=notify configuration [0].
Debian uses a forking config for it's clustered setup [1], maybe it was
derived from there.

The unit was changed to notify in [2] and I think this commit should
have also removed the PIDFile.

(for the initial topic this isn't an issue because /var/lib is still a
valid folder, but while we're at it...)


[0] https://www.postgresql.org/docs/12/server-start.html
[1]
https://salsa.debian.org/postgresql/postgresql-common/-/blob/master/systemd/postgresql at .service
[2]
https://git.busybox.net/buildroot/commit/package/postgresql/postgresql.service?id=eada187e77022f0da30884a826dc1767ba99abe8

Regards,
Michael
