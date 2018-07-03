From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Jul 2018 00:56:27 +0200
Subject: [Buildroot] [PATCH 00/50] busybox: invert dependencies
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <907b4fa8-f2c6-120d-4980-95b9a5e656a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/02/18 23:12, Yann E. MORIN wrote:
> Hello All!
> 
> Currently, the issue that busybox may install the same executables as
> those from other packages, is handled in all those packages. This is
> not very practical.

 The reverse is also not very practical...

> Furthermore, this means that those packages all overwrite the
> busybox-installed applets, which means that this triggers the
> no-two-packages-touch-the-same-file rule. So far, this is only a
> warning, but when we eventually go with TLPB, we'll have to enforce
> that rule.

 Although we've already discussed this a couple of times in BR meetings, we
never found a solution that is really satisfactory.

 However, I have a new idea now...

 IIUC, with PPS, there is no real problem with two packages touching the same
file, as long as the dependency is explicitly tracked in Buildroot, right?
Because when it is explicitly tracked, the file created by package A will always
be present in package B's PPS when package B is built, so it's perfectly
reproducible.

 For the case of two packages *writing* the same file (without looking at the
previous contents, i.e. not appending or anything like that), the constraint is
even lighter: there doesn't really need to be an explicit dependency, we just
have to make sure that when the rsync is done, the order is predictable. That's
just a matter of sorting. But also, we want it not just to be predictable, but
also in the "correct" order, e.g. if busybox is a dependency, it should be
rsync'd before another package that creates the same executable. The rsync will
then overwrite it (because the rsyncs are not done in parallel).

 For that particular ordering, I think there could be a simpler solution than
enumerating all those dependencies in busybox.mk. We could give each package a
priority, and use that priority to order the rsync's. The default priority would
be e.g. 5, and busybox would get e.g. 3. That way, we only need BUSYBOX_PRIORITY
= 3 in busybox.mk, and everything is solved.

 Obviously, it would make the infra more complicated :-)

 We would then also need to change the "two packages touching same file" check
to be error out only if they have the same priority.

 For the other packages that install the same file (e.g ntp <> openntpd, the
different nmaps, ...), we can then use the same simple resolution rather than
explicitly encoding the dependency. We would still need to choose the priority
(which is a bit arbitrary), we would still need to detect the conflict, and we
would still need to verify that this conflict really is of the "overwrite" type
and not the "append" type. So it's not a silver bullet, but it might make
maintenance a little bit simpler.

 What do you think?

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
