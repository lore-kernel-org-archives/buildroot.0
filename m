From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Nov 2015 00:14:48 +0100
Subject: [Buildroot] [v3 0/2] openssl: parallel build
In-Reply-To: <CAMQcK5+S=aDv3qtA6vdzeqgqSq6Xd4xUBYjvHQat=pg1Ot72gA@mail.gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <20151118135709.125f4afd@free-electrons.com>
 <CAMQcK5+S=aDv3qtA6vdzeqgqSq6Xd4xUBYjvHQat=pg1Ot72gA@mail.gmail.com>
Message-ID: <564D0668.6070003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 20:41, Ryan Barnett wrote:
> Hi Thomas,
> 
> On Wed, Nov 18, 2015 at 6:57 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> I have the feeling that the parallel build patches for OpenSSL are not
>> working properly. Look at the recent build failures we've got for the
>> openssl and host-openssl builds:
>>
>>   http://autobuild.buildroot.org/?reason=openssl-1.0.2d
>>   http://autobuild.buildroot.org/?reason=host-openssl-1.0.2d
>>
>> They are pretty much all due to a similar error:
>>
>>   ln: failed to create symbolic link 'libssl.so': File exists
>>   ln: creating symbolic link `libcrypto.so': File exists
>>
>> I could spot only one that is different:
>>
>> In file included from apps.h:117:0,
>>                  from req.c:74:
>> ../include/openssl/bio.h:521:34: error: expected ';' before 'BIO_ctrl'
>>  # define BIO_set_fp(b,fp,c)      BIO_ctrl(b,BIO_C_SET_FILE_PTR,c,(char *)fp)
>>
>> Do you have some ideas?
> 
> I agree with you in that it looks like are some issues with the
> parallel build. It appears there is a hard to track down race
> condition due a symbolic being created twice during the build but as
> to way I don't have any clue.

 I can see where the problem is, but not what the solution is... The
build-shared target depends on do_crypto and link-shared, which will be executed
in parallel. do_crypto calls link_a.linux_shared -> link_a.gnu which does
SYMLINK_SO; in parallel, link-shared calls symlink.linux_shared which also does
SYMLINK_SO. Before the symlink is created, it is rm'ed, but there is a tiny
chance that the second one is created after the rm has been called. Bam.

 Maybe just replace the rm with an ln -sf? Don't know if upstream will like that
though.

 Regards,
 Arnout


> 
>> Does Gentoo has some more patches?
> 
> No this is the only patch for openssl 1.0.2d. There also hasn't been
> any updates to this patch other then the one that is currently there.
> 
>> Should we revert back to non-parallel build for OpenSSL ?
> 
> I guess I will leave that up to either yourself or Peter if you feel
> that it should. I don't have time in the next week or two to
> investigate the problem further so I'm OK with reverting this patch.
> 
> Thanks,
> -Ryan
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
