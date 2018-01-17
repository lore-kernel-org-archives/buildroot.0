From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jan 2018 00:28:36 +0100
Subject: [Buildroot] linux-firmware hash mismatch (tar-1.30)
In-Reply-To: <20180114133016.GA20105@scaer>
References: <20180109161531.47ec21e0.john@metanate.com>
 <87vag9plt1.fsf@dell.be.48ers.dk> <20180111105557.6f97bb46.john@metanate.com>
 <20180114133016.GA20105@scaer>
Message-ID: <ef492963-bf3b-3fbb-f5b1-bba0126f3884@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-01-18 14:30, Yann E. MORIN wrote:
> John, Peter, All,
> 
> (adding Thomas and Arnout)
> 
> On 2018-01-11 10:55 +0000, John Keeping spake thusly:
>> On Wed, 10 Jan 2018 20:15:38 +0100, Peter Korsgaard wrote:
>>>>>>>> "John" == John Keeping <john@metanate.com> writes:  
>>>  > ERROR: linux-firmware-17e6288135d4500f9fe60224dce2b46d850c346b.tar.gz has wrong sha256 hash:
>>>  > ERROR: expected: 28d359523a36c1cdc3e85a8e148bb2d68b036d28b10f0e80a192f3dc29f02c16
>>>  > ERROR: got     : bf6fe8d7620949a3e771954cb6d9d18dcf000d37ecc910a7cf69723c1798e246
>>>  > ERROR: Incomplete download, or man-in-the-middle (MITM) attack  
>>>  > After a bit of digging, it looks like this is caused by tar-1.30 which
>>>  > includes the following fix:  
>>>  > * --numeric-owner now affects private headers too.  
>>> Gaah, what a mess :/

 Note that this also means our github hashes will break again...

[snip]
>> I don't think it's possible to reproducibly create bit-identical
>> archives without using the same software version to produce the archive.
> 
> Alas, this means that we can only depend on building our own tar...

 Nah, let's not go there.

> Even when we eventually support using a local git-clone cache, this we
> not solve the issue has the hashes we store are on the generated
> tarball...

 However, the way we create a git tarball can serve as a source of inspiration
of how to solve it. Instead of hashing the tarball, we can hash the contents of
the tarball instead, using --to-command and a support script (--to-command
exists since 1.15.90 and our minimal tar version is 1.17). The support script
would print the metadata and a hash of the contents. And the output of all that
is piped into sort (to make sure the order of files in the tarball isn't
relevant) and shasum.

 That way we don't rely on the way the user's tar behaves at all. We really
check the contents of the tarball. It would also mean we can drop the complexity
in the git download helper and directly use git archive.

 It does create additional overhead, since the tarball will be uncompressed
twice: once for calculating the hash, and again when extracting. But normally
calculating a shasum should take significantly longer than decompressing, so I
don't expect this to have a big impact.


 Of course, introducing such a feature would break all existing hashes in one
fell swoop... So to avoid that, I would introduce a new hash type, sha256-tar,
that does this trickery.


 One small additional thing: we'll probably have to pass the result of
suitable-extractor to the download helper and down check-hash; alternatively, we
have to duplicate that logic, or move it to a script that is called from check-hash.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
