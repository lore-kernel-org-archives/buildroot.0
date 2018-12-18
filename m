From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2018 15:32:03 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <353c4c5d-5064-f92d-bfd0-5232bad2204a@licor.com>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com> <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer> <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
 <20181218084937.47142880@windsurf>
 <353c4c5d-5064-f92d-bfd0-5232bad2204a@licor.com>
Message-ID: <06b4ea81-0a24-4242-7525-a142345c516c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/12/2018 15:14, Chris Lesiak wrote:
> 
> On 12/18/18 1:49 AM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 17 Dec 2018 23:59:04 +0100, Arnout Vandecappelle wrote:
>>
>>>   Which brings me to my question to Chris: what was the purpose of this patch to
>>> begin with? Since OPENSSH_USERS is already set, the sshd user will already exist
>>> in /etc/passwd, so the sysusers.d directive will be ignored... Either that, or
>>> our mkusers script doesn't work correctly.
>> Stateless systems, where /etc and /var don't even "exist" in a
>> persistent fashion, and are entirely populated at boot time.
>>
>> Best regards,
>>
>> Thomas
> 
> 
> In my particular case, /etc is empty on first boot, but retains state 
> after that.? Even if I started with a populated /etc/passwd, when 
> updating /usr (switching in a new version to update the the OS), I might 
> have new services with associated users that I would like to have 
> automatically added to /etc/passwd.

 That's a very good motivation!

 So you're generating a rootfs with empty /etc? Do you need any other changes to
make that work? To support this use case, it would be nice if we could add an
option to the system menu that enables it (this would depend on systemd of
course), so that it can be used fo force packages to do whatever is needed to
support empty /etc. And then we can add a post-build check that /etc is really
empty at the end of the build, so that the autobuilders can detect problems.

 Regards,
 Arnout
