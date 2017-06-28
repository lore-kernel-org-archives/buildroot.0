From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jun 2017 13:16:06 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <b3e97095-7453-5516-0f23-e68e56932930@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <6a236664-6cd5-c2e6-e4bc-ee5f7b6b21a1@grandegger.com>
 <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be>
 <4243e8e2-baaf-37f5-4149-d085388f3b13@grandegger.com>
 <319491ac-9a65-f82f-892c-1e54b8df70da@mind.be>
 <b3e97095-7453-5516-0f23-e68e56932930@grandegger.com>
Message-ID: <790e33dd-2285-dd7e-7203-692f2cd3686f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-06-17 12:57, Wolfgang Grandegger wrote:
[snip]
> The list is built with "comm -13 ...". While implementing that way, I realized
> that I need patchelf for the host as very first package. Any idea how that could
> achieved?

 host-patchelf should be added to DEPENDENCIES_HOST_PREREQ so it gets built
before all the rest. In the instrumentation hook, you should also skip the
sanitization when the package is not in DEPENDENCIES_HOST_PREREQ.

 That means that those packages will not get sanitized - which shouldn't be
necessary since they anyway don't have an rpath. But perhaps it's a good idea
then to add a readelf-based check for them that verifies they don't have
DT_RUNPATH or DT_RPATH. The latter is just a nice-to-have, though, so don't
worry about it at first.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
