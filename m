From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jan 2016 22:36:37 +0100
Subject: [Buildroot] [PATCH] fakeroot: fix build when libcap-dev is
 installed
In-Reply-To: <568AB024.40104@mind.be>
References: <1451908883-4942-1-git-send-email-luca@lucaceresoli.net>
 <568AB024.40104@mind.be>
Message-ID: <568AE5E5.3020307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-01-16 18:47, Arnout Vandecappelle wrote:
>  Hi Luca,
> 
> On 04-01-16 13:01, Luca Ceresoli wrote:
>> On an Ubuntu host, and probably several other build hosts,
>> host-fakeroot fails building when libcap-dev is installed.
>>
>> Error message:
>>
>>   libfakeroot.c:1646:9: error: conflicting types for 'setxattr'
>>    ssize_t setxattr(const char *path, const char *name, void *value, size_t size, int flags)
>>            ^
>>   In file included from /usr/include/sys/capability.h:30:0,
>>                    from libfakeroot.c:131:
>>   /usr/include/x86_64-linux-gnu/sys/xattr.h:39:12: note: previous declaration of 'setxattr' was here
>>    extern int setxattr (const char *__path, const char *__name,
>>               ^
>>
>> To reproduce the bug:
>>
>>   make defconfig && make host-fakeroot
>>
>> This is a fakeroot bug fixed in Debian since 1.20.1-1 [0]. Apply the
>> patch [1] to Buildroot as well.
> 
>  Are we sure this will not break again on other distros or older Debian/Ubuntu?

 I prefer Ricardo's alternative.

 We will have to pay attention however, if upstream (i.e. Debian?) releases a
new version, that we _don't_ take this patch along. Although I'm not sure if the
upstream patch really breaks the build on older systems, I haven't checked when
xattr.h has changed.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
