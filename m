From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Nov 2017 23:50:08 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <20171106175012.GA2763@scaer>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be> <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
 <20171106175012.GA2763@scaer>
Message-ID: <ce053465-f273-fd04-2627-84bd438f6117@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-17 18:50, Yann E. MORIN wrote:
> Einar, All,
> 
> On 2017-11-06 10:43 +0100, Einar J?n spake thusly:
>> On 5 November 2017 at 09:46, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> I still fail to see what is wrong with the current situation...
>>
>> The point is that you currently have close to 1900 packages. Most
>> commits only changes 1 package.
>> So you have 1899 packages with the exact same source code, but they
>> produce different binaries because someone changed the 1900th package.
>> Some people see that as an issue.
> 
> But you usually have no way, Buildroot-wise, to know that a change in a
> package has no impact on other packages.
[snip good explanation of how this can happen]
> So we do really want to have SOURCE_DATE_EPOCH, *as exported by Buildroot*,
> to contain the date of the last git commit, because that is what makes
> sense: the whole recipe has changed, because one of its constituent has
> changed, so the result as a whole will change.

 ... except that SOURCE_DATE_EPOCH is NOT a 'hash' or identifier of the
reproducible build. On the contrary, it is just there to make sure that two
builds *of the same configuration* at different times will give the same
binaries. If the configuration is different, then the binaries will be different
whatever the value of SOURCE_DATE_EPOCH.

 So really, we could just set SOURCE_DATE_EPOCH to 0 (1 Jan 1970) and be done
with it. The only reason to have a "reasonable" value of SOURCE_DATE_EPOCH is
that __DATE__ and __TIME__ expand to somewhat meaningful values.


 It would be an entirely different story if we would start using
BR2_VERSION_GIT_EPOCH as a kind of version marker to be able to reuse a
previously built tarball of the per-package SDK-and-target directories. But
we're not quite there yet :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
