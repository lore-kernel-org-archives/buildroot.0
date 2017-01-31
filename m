From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 17:38:24 +0100
Subject: [Buildroot] [PATCH] redis: bump version to 3.2.7
In-Reply-To: <20170131161904.28657-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 31 Jan 2017 16:19:04 +0000")
References: <20170131161904.28657-1-Vincent.Riera@imgtec.com>
Message-ID: <87k29bqj5r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Please mention whenever version bumps have security impact - E.G. from
the release notes:

Redis 3.2.7 is out and it has important fixes, two are related to the
security of the server, so please keep reading and if it's the case,
upgrade.

Upgrade urgency HIGH.

This release fixes important security and correctness issues. It is
especially important to upgrade for Redis Cluster users and for users
running Redis in their laptop since a cross-scripting attack is fixed in
this release.

Main bugs fixes and improvements in this release:

    MIGRATE could incorrectly move keys between Redis Cluster nodes by
    turning keys with an expire set into persisting keys. This bug was
    introduced with the multiple-keys migration recently. It is now
    fixed. Only applies to Redis Cluster users that use the resharding
    features of Redis Cluster.

    As Redis 4.0 beta and the unstable branch already did (for some
    months at this point), Redis 3.2.7 also aliases the Host: and POST
    commands to QUIT avoiding to process the remaining pipeline if there
    are pending commands. This is a security protection against a "Cross
    Scripting" attack, that usually involves trying to feed Redis with
    HTTP in order to execute commands. Example: a developer is running a
    local copy of Redis for development purposes. She also runs a web
    browser in the same computer. The web browser could send an HTTP
    request to http://127.0.0.1:6379 in order to access the Redis
    instance, since a specially crafted HTTP requesta may also be
    partially valid Redis protocol. However if POST and Host: break the
    connection, this problem should be avoided. IMPORTANT: It is
    important to realize that it is not impossible that another way will
    be found to talk with a localhost Redis using a Cross Protocol
    attack not involving sending POST or Host: so this is only a layer
    of protection but not a definitive fix for this class of issues.

    A ziplist bug that could cause data corruption, could crash the
    server and MAY ALSO HAVE SECURITY IMPLICATIONS was fixed. The bug
    looks complex to exploit, but attacks always get worse, never better
    (cit). The bug is very very hard to catch in practice, it required
    manual analysis of the ziplist code in order to be found. However it
    is also possible that rarely it happened in the wild. Upgrading is
    required if you use LINSERT and other in-the-middle list
    manipulation commands.

    We upgraded to Jemalloc 4.4.0 since the version we used to ship with
    Redis was an early 4.0 release of Jemalloc. This version may have
    several improvements including the ability to better reclaim/use the
    memory of system.

-- 
Bye, Peter Korsgaard
