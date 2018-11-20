From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2018 00:47:31 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181120185005.GE2601@scaer>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com> <20181113210216.37879bd4@windsurf>
 <20181113202946.GH10271@scaer> <016ed0ed-6489-2fa0-a32e-9f2a6918af01@mind.be>
 <20181115190558.GM10271@scaer> <20181116093513.152dc10c@windsurf>
 <20181120185005.GE2601@scaer>
Message-ID: <568b0b64-9f19-9aa7-a3bc-86863e2c9b91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2018 19:50, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-16 09:35 +0100, Thomas Petazzoni spake thusly:
>> On Thu, 15 Nov 2018 20:05:58 +0100, Yann E. MORIN wrote:
>>>>  Since we have the same problems sometimes with github tarballs, I think we need
>>>> a more fundamental solution. I would propose a new tarsha256 hash type, which
>>>> extracts the tarball to calculate the hash. In a simple version it's not so
>>>> complicated, something like
>>>>
>>>> tar -xf - --to-command=$(TOPDIR)/support/scripts/tarsha256 | sort | sha256sum -
>>>>
>>>> where tarsha256 contains:
>>>>
>>>> { echo $TAR_FILENAME; echo $TAR_MODE; echo $TAR_FILETYPE; cat - } | \
>>>> 	sha256sum - | cut -f 1 -d ' '
>>>>
>>>> As usually, entirely untested.  
>>>
>>> I don't like it, because this is totally non-standard. People expect to
>>> be able to check hashes by running the *usual* XXXsum commands, directly
>>> on the shipped/received files.
>>>
>>> Introducing our own hash mechanism, how reliable or simple as it would
>>> be, breaks this assumption, and the tool to actually check them is not
>>> available at all except internally to Buildroot, so it is not possible
>>> to reproduce the checks outside of Buildroot.
>>>
>>> This goes counter one of the initial goal of hashes, which is to be able
>>> to track archives and their validity across a supply chain, inbound (as
>>> sent by a provider to Buildroot, to do the build) or outbound (as received
>>> by a recepient, from Buildroot, for compliance) alike.
>>
>> I understand this argument, but do you have some alternative solution ?
> 
> No.
> 
> Also, the tarshasum thingy would not work either, because it is not
> enough to hash the content of files. There are cases where the metadat
> also matters, for example if a tarball is regenerated with new dates in
> it. This could trigger a rebuild of parts of the package, for example if
> configure.ac is now younger than configure. Obviously, we could add that
> info to be hashed...

 Yes, I forgot to include the comment that we need to investigate which of
mtime, ctime and atime need to be included in the hash.


> Until we find anotehr type of info we can't get via the --to-command,
> like extended attributes for example...

 Other metadata we explicitly exclude. Hm, we don't but we should :-)


 BTW, turns out that https://github.com/mikemccabe/tarsump is not usable - it
doesn't sort the files, and it doesn't compute an overall hash.

 Regards,
 Arnout

> 
> So, I am still opposed to the tarshasum idea.
> 
>> Even building our own host-tar and host-gzip doesn't solve entirely the
>> problem, because it doesn't solve the case of tarballs fetched from
>> github, that tend to change in subtle ways once in a while.
> 
> For that, we can simply decide to ditch the github macro, and revert
> to using Github for what it is: a git repository, and switch to the git
> method.
> 
> Yes, yes, I know, this is a shame, especially since there are big
> repositories out there. But OTOH, we now have the git cache, so it
> should not be such a hassle in the end.
> 
> Regards,
> Yann E. MORIN.
> 
