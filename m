From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 13:26:15 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-download: use raw basename for repo
 archiving to remove host- prefix
In-Reply-To: <CAAXf6LW-eM54JAcB9aphG9SmriKhskeTMu4qGBHZjfN7y-+r0A@mail.gmail.com>
References: <1476709687-21484-1-git-send-email-patrickdepinguin@gmail.com>
 <c436b9ba-8144-3015-347c-1c5e89115272@mind.be>
 <CAAXf6LW-eM54JAcB9aphG9SmriKhskeTMu4qGBHZjfN7y-+r0A@mail.gmail.com>
Message-ID: <5481ac40-7f66-9ece-9eaa-bea697e1a1ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 12:31, Thomas De Schampheleire wrote:
> On Mon, Oct 17, 2016 at 10:52 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Thomas,
>>
>>  Excellent commit message!
>>
>> On 17-10-16 15:08, Thomas De Schampheleire wrote:
>>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[snip]
>>  This is wrong (i.e., a bug), in two ways:
>> - for reproducible download methods (git at least; is hg archive reproducible?),
>> the hash *should* be checked;
> 
> Yes, as far as I know hg archive behaves just like git archive and is
> reproducible.
> 
>> - for non-reproducible download methods, the hash *should not* be checked when
>> downloading from primary or secondary - if it is a non-reproducible download
>> method, then the hash in primary or secondary may also be wrong.
> 
> Can you give an example of a non-reproducible download?

 CVS and SVN for sure. It does a checkout and then makes a tarball of that, but
without resetting timestamps. Even if they do set mtime (and I'm not sure if CVS
will do that), the tarball will contain ctimes of the time of checkout. But as I
wrote later, they could be made reproducible by tarring in the same way as is
done for git.


> 
>>
>>  The second case, however, i.e. the one you are hitting, should already be
>> covered... In DOWNLOAD_INNER, we set BR_NO_CHECK_HASH_FOR=$(2) for the
>> non-hash-checked download methods. Ah, of course, it's not the hash check that
>> fails, it's the fact that a hash file is present but the tarball isn't mentioned
>> in it.
> 
> In the case of squashfs, there is a hashfile, the tarball _is_
> mentioned in it, but either the vcs method is used and then the hash
> file is not checked, or a primary site is used and then the hash file
> is checked but the hash is incorrect if it was downloaded as
> host-squashfs.
> 
>>
>>  Actually, we could make all download methods reproducible using the method that
>> we use for git to make a reproducible tarball. Well, maybe CVS is an exception.
>>
>>>
>>> While packages matching the third condition could be considered to be 'wrong'
>>> and need to be fixed, it does actually makes sense to have a hash file for
>>> packages from version control, in particular if they are stored in a
>>> primary site as mentioned in the last condition.
>>>
>>> Regardless of any different opinions on the previous paragraph, it is also
>>> not conceptually correct that a tarball of a package source can contain a
>>> Buildroot-specific directory prefix 'host-'.
>>
>>  Even worse, it is incorrect that the tarball name depends on the order in which
>> things are executed...
> 
> The tarball name itself was correct for squashfs and thus git. I
> haven't explicitly checked the other download methods.
> It was only the contents.

 Ah, now I get it: the tarball contains host-squashfs-x.y.z/foo files instead of
squashfs-x.y.z/foo. I should have just tried the test case you provided.


 Regards,
 Arnout

> 
>>
>>> Therefore, use
>>> FOO_RAW_BASE_NAME instead of FOO_BASE_NAME when calling the dl-wrapper.
>>>
>>> Example test scenario that exhibits the problem:
>>> $ rm -rf /tmp/dl dl/squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz
>>> $ make qemu_x86_64_defconfig
>>> $ make host-squashfs-dirclean host-squashfs-source
>>> $ mkdir /tmp/dl
>>> $ mv dl/squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz /tmp/dl/
>>> $ sed -i -e 's,BR2_PRIMARY_SITE=.*,BR2_PRIMARY_SITE="file:///tmp/dl",' \
>>>          -e '/BR2_PRIMARY_SITE/aBR2_PRIMARY_SITE_ONLY=y'  .config
>>> $ make host-squashfs-dirclean host-squashfs-source
>>
>>  All right! As soon as the test infra is merged we can add a test for this!
>>
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Thanks!
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
