From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Sep 2017 23:24:55 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
In-Reply-To: <CAHfJR7jTT1tGBQr-rgZ+JTZQW6rEhagyDJBQAfB0yUPJwh_evw@mail.gmail.com>
References: <20170908134548.23645-1-julien.floret@6wind.com>
 <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
 <CAHfJR7jjCn8FdGqhKOq=7_pAgwObLNSQUdzzdbzOi+ijyvJLCw@mail.gmail.com>
 <d60e9f05-f4d2-3927-ee7f-148d6db4c22c@mind.be>
 <CAHfJR7jTT1tGBQr-rgZ+JTZQW6rEhagyDJBQAfB0yUPJwh_evw@mail.gmail.com>
Message-ID: <f14a15ee-4bc9-ffc0-38f1-fd15ebe43790@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 14:16, Julien Floret wrote:
[snip]
> Honestly, I could not tell... netsnmp is quite complicated. Ensuring
> we don't lose any functionality after changing the default modules
> would probably require a deeper investigation and knowledge of netsnmp
> code that I'm not able to do right now. And it seems netsnmp "make
> install" installs MIB description files, whether or not the module(s)
> using them are enabled or not.
> What's more, if I recall correctly, modules can still work without
> their MIB description file - they just cannot translate object IDs
> into human-readable names.

 OK. Well, the only thing this patch does, in the end, is make the target
filesystem a bit bigger. By how much, do you know?

 Users can always remove unneeded MIBs in a post-build script.


> But without this patch, netsnmp is unusable for us, because we need
> the object names and this hardcoded BLOAT_MIBS list removes mandatory
> MIB files whatever the configuration options.

 That's a good reason!

> (By the way, some of the MIBS in BLOAT_MIBS (RFC-1215 and RFC1155-SMI)
> don't seem to be suppressed, because the suffix added in
> NETSNMP_REMOVE_BLOAT_MIBS ("-MIB.txt") doesn't apply for them...)

 Yeah, the option is from the very first time the package was added 7 years ago,
and hasn't been updated through all the version bumps...


>>  Probably extending BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES should be a separate
>> patch anyway.
> 
> Yes, probably. I'm not sure these default values are the most common
> case, however.

 Never mind that, since it's anyway not really related, as you say.


> Also, IMHO having two options {WITH,WITHOUT}_MIB_MODULES makes quite
> difficult to know which modules are really enabled in the end.
> I'm starting to think that maybe a better approach would be to have
> one Config.in option per module... This would be clearer and would
> perhaps also allow removing unused MIB files according to the modules
> that are enabled or not.

 But that would make for a really long list of options, no? I think that that's
a bit too much.


> 
> So do you think this patch is acceptable for now?

 I've applied, thanks.

 Perhaps you could write up a CHANGES entry that explains that people should
remove unneeded MIBs in a post-build script?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
