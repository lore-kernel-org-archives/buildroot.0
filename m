From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 12:24:34 +0200
Subject: [Buildroot] [PATCHv2 2/2] instrumentation: extend
 packages-file-list.txt with symlinks and directories
In-Reply-To: <CAAXf6LW2dGORao22RQyPfrM9K+uyQnRA8-ZGaGb9yF4gpVTVhQ@mail.gmail.com>
References: <20170205134507.15328-1-patrickdepinguin@gmail.com>
 <20170205134507.15328-3-patrickdepinguin@gmail.com>
 <51252cb1-29de-deb1-f21f-6aa8ac243afa@mind.be>
 <CAAXf6LW2dGORao22RQyPfrM9K+uyQnRA8-ZGaGb9yF4gpVTVhQ@mail.gmail.com>
Message-ID: <329a4156-4d0d-b77f-9539-3ae2e0cb41ec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 12:12, Thomas De Schampheleire wrote:
> Hi Arnout,
> 
> Thanks for your review, please see below...
> 
> 2017-07-03 16:47 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 05-02-17 14:45, Thomas De Schampheleire wrote:
[snip]
>>>  define _step_pkg_size_get_file_list
>>> -     (cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>>> -             $1
>>> +     (cd $(TARGET_DIR) ; \
>>> +             ( \
>>> +                     find . -xtype f -print0 | xargs -0 md5sum ; \
>>> +                     find . -xtype d -print0 | xargs -0 -I{} printf 'directory  {}\n'; \
>>
>>  I don't see symlinks being handled here, or am I missing something?
> 
> the clue is in the 'xtype', 'xtype f' is true if the target is a file
> or a link to a file, 'xtype d' is true if target is directory or link
> to directory.

 Thanks, I missed that. But if we want to store symlinks explicitly in the file
with the -> construct it'd need an explicit -type l, right?

> 
>>
>>  Would it be too crazy to do things in a single find command?
>>
>>         find . \( -xtype f -exec md5sum '{}' \; \) -o \
>>                 \( -xtype d -exec printf 'directory %s' '{}' \;
> 
> I'm fine with either way but xargs is more efficient as it groups
> arguments in a single invocation, at least for the md5sum call. To get
> the same behavior with find one would need to use the syntax "-exec
> command {} +" rather than "-exec command ;" .

 Great! I like it! For the symlink part we still may need xargs though.

 Regards,
 Arnout

> 
> Best regards,
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
