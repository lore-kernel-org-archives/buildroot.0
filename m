From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 10:12:11 +0200
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <20170718095702.56523c1f@windsurf>
References: <20170717212859.12581-1-arnout@mind.be>
 <20170718095702.56523c1f@windsurf>
Message-ID: <d958d5e4-3a8e-886d-5cc0-b632b15bd748@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 09:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Jul 2017 23:28:59 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> This option allows to specify which Buildroot git repository to clone.
>> This can be useful in several situations:
>> - to use a different mirror in case you don't have a good connection to
>>   github;
>> - for debugging this script;
>> - to point to a local, patched repository you want to test.
>>
>> Note that the clone/pull will use the currently checked out branch of
>> the repository if it is non-bare, which is ideal for testing.
>>
>> Since switching repositories may also switch branches, we use a git
>> fetch/checkout sequence instead of doing a git pull. With git pull, the
>> branches would be merged instead of switched. To avoid polluting the
>> log with the long git message about a detached head, while still
>> getting some useful output from git, pass the --detach option to
>> git checkout.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> My concern about such change (which I've already expressed in the past)
> is to see build results submitted to the public autobuild.b.o instance
> that do not correspond to an upstream Buildroot version.
> 
> Would it be reasonable to request that if a custom repo is used, then
> uploading the results to autobuild.b.o is not possible ?

 But Matt's use case is exactly that he doesn't have a good connection to the
upstream repo so he wants to use a mirror, but still upload to a.b.o.

 Admittedly, this is exactly what lead to the recent problems with Matt's
autobuilder...


> Or am I too zealous about this ?

 Yes you are. Without this change, someone like Matt will just edit the
autobuild-run script and you still have the same problem :-)

 Perhaps we can make the problem at least detectable, by pushing *kwargs to
a.b.o in addition to the BR git ID. But that obviously requires modifications on
a.b.o itself, which is a bit more difficult to organize I guess.


 Since you're the BDFL for autobuild-run, feel free to follow up this patch with
something that disables uploading if --repo is non-default. And let Matt solve
his own problems :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
