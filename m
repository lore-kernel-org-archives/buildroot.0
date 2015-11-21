From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Sat, 21 Nov 2015 10:32:13 -0600
Subject: [Buildroot] [PATCH v2] openssl: fix race condition when symlink
 shared libs
In-Reply-To: <565070A7.10001@mind.be>
References: <1448036610-7077-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <565070A7.10001@mind.be>
Message-ID: <CAMQcK5+-nXtVvQPz++ekYdQyZY8vXvqksue5jH80BYUPaXsu_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Nov 21, 2015 at 7:24 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20-11-15 17:23, Ryan Barnett wrote:
>> The build-shared target depends on do_crypto and link-shared, which
>> will be executed in parallel. do_crypto calls
>> link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
>> link-shared calls symlink.linux_shared which also does SYMLINK_SO.
>> Before the symlink is created, it is rm'ed, but there is a tiny chance
>> that the second one is created after the rm has been called.
>>
>> Fix this by using 'ln -sf' instead of 'ln -s' so the build doesn't
>> error out.
>>
>> Patch submitted upstream at:
>>   https://bugs.gentoo.org/show_bug.cgi?id=566260
>
>  Ahem, gentoo is not exactly upstream :-)  From [1]:
>
> To report a bug or make an enhancement request, send email to rt at openssl.org. In
> the subject line, please make sure to indicate if it's a bug or a fix, and a
> brief description of the issue. In the body of your mail, please include the
> versions of the operating system and OpenSSL you are using. If you have a patch
> or diff, please send it as an attachment, and not inline in the message body.
>
>  As far as I can see, this patch should still apply (in slightly adapted form)
> to the real upstream.

Yes I agree to submit it upstream directly to openssl. However, I
started with Gentoo since there are the ones that seem most interested
in making OpenSSL work in parallel. I have also just sent an email to
OpenSSL about the issue.

I think this patch is pointless now since it doesn't actually fix the
problem that existed before. Please see my reply to this patch earlier
describing that 'ln -sf' isn't an atomic operation and the error from
the build failures still will exist:

http://lists.busybox.net/pipermail/buildroot/2015-November/144882.html

>>
>> Thanks to Arnout for explain the issue (wording used above).
>
>  You're a native English speaker, right? explain -> explaining :-)

Yes but I never claimed to be great at translating my English thoughts
to properly written sentence ;) This is especially true when I type up
something in a hurry which this commit message was.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
