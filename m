From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 4 Oct 2015 14:46:24 +0200
Subject: [Buildroot] [PATCH v4 2/3] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <56111DC3.7030109@mind.be>
References: <1443892938-17039-1-git-send-email-luca@lucaceresoli.net>
 <1443892938-17039-3-git-send-email-luca@lucaceresoli.net>
 <56111DC3.7030109@mind.be>
Message-ID: <56111FA0.9090000@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

thanks for the series review.

Il 04/10/2015 14:38, Arnout Vandecappelle ha scritto:
> On 03-10-15 18:22, Luca Ceresoli wrote:
>> A trailing slash in FOO_SITE is useless, since Buildroot automatically adds
>> a slash between FOO_SITE and the filename as appropriate.
>>
>> Moreover it is potentially harmful, which led to introducing a workaround
>> to strip them:
>>
>>      commit 1cbffbd015106ea90fe49e27433375769dc1035b
>>      Author: Shawn J. Goff <shawn7400@gmail.com>
>>      Date:   Fri Apr 12 09:40:30 2013 +0000
>>
>>          eliminate double slashes caused by FOO_SITE ending in a slash
>>
>>          When a FOO_SITE variable ends in a slash and gets joined with a
>>          FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
>>          has a double slash. While double-slashes are fine in unix paths, they
>>          are reserved in URIs - the part following '//' must be an authority.
>>
>> So let's ban trailing slashes entirely. They have all been removed in
>> a 7b0e757fb85fd, now add a check to error out loudly in case a new one
>> is added.
>>
>> Example commands to test this check:
>>
>>    $ make busybox-dirclean busybox-source
>>    rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
>>    busybox-1.23.2.tar.bz2: OK (md5: 7925683d7dd105aabe9b6b618d48cc73)
>>    busybox-1.23.2.tar.bz2: OK (sha1: 7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16)
>>    $
>>    $ make BUSYBOX_SITE=http://www.busybox.net/downloads/ busybox-dirclean busybox-source
>>    rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
>>    BUSYBOX_SITE (http://www.busybox.net/downloads/) cannot have a trailing slash
>>    make[1]: *** [/home/murray/devel/buildroot/output/build/busybox-1.23.2/.stamp_downloaded] Error 1
>>    make: *** [_all] Error 2
>>    $
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Baruch Siach <baruch@tkos.co.il>
>
>   I'm not going to give it my Rev-by tag since I partly wrote it myself but it
> does look good to me.

Should I add your Signed-off-by and resend?

-- 
Luca
