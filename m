From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Dec 2013 23:04:56 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <529C54A1.3050805@syscom.ch>
References: <1385384136-22652-1-git-send-email-rebillout@syscom.ch>
 <1385384136-22652-2-git-send-email-rebillout@syscom.ch>
 <52939017.20203@mind.be> <529C54A1.3050805@syscom.ch>
Message-ID: <529D0408.5020306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/13 10:36, Arnaud R?billout wrote:
> Hello Arnout,
>
> On 11/25/2013 06:59 PM, Arnout Vandecappelle wrote:
>> On 25/11/13 13:55, Arnaud R?billout wrote:
[snip]
>>> +if BR2_PACKAGE_LFTP
>>> +
>>> +comment "Commands"
>>> +
>>> +config BR2_PACKAGE_LFTP_CMD_MIRROR
>>> +    bool "Mirror command"
>>> +    help
>>> +      Enable mirror command
>>> +
>>> +config BR2_PACKAGE_LFTP_CMD_SLEEP
>>> +    bool "Sleep command"
>>> +    help
>>> +      Enable sleep command
>>> +
>>> +config BR2_PACKAGE_LFTP_CMD_TORRENT
>>> +    bool "Torrent command"
>>> +    help
>>> +      Enable torrent command
>>
>>  Is it needed/useful to have all these options? Do they have a big
>> impact on size?
>
> Yep, they save a significant amount of space.
>
> Here are the mandatory things for lftp. Alltogether, it's 1080 Kb.
> $ du -h output/target/usr/bin/lftp*
> 44K    output/target/usr/bin/lftp
> 4.0K    output/target/usr/bin/lftpget
> $ du -h output/target/usr/lib/liblftp-* | grep -v -e '^0' -e 'la$'
> 276K    output/target/usr/lib/liblftp-jobs.so.0.0.0
> 512K    output/target/usr/lib/liblftp-tasks.so.0.0.0
> $ du -h output/target/usr/lib/lftp/4.4.10/liblftp*
> 232K    output/target/usr/lib/lftp/4.4.10/liblftp-network.so
> 12K    output/target/usr/lib/lftp/4.4.10/liblftp-pty.so
>
> Now come the things that can be disabled:
> $ du -h output/target/usr/lib/lftp/4.4.10/* | grep -v liblftp
> 44K    output/target/usr/lib/lftp/4.4.10/cmd-mirror.so
> 16K    output/target/usr/lib/lftp/4.4.10/cmd-sleep.so
> 164K    output/target/usr/lib/lftp/4.4.10/cmd-torrent.so
> 24K    output/target/usr/lib/lftp/4.4.10/proto-file.so
> 32K    output/target/usr/lib/lftp/4.4.10/proto-fish.so
> 128K    output/target/usr/lib/lftp/4.4.10/proto-ftp.so
> 84K    output/target/usr/lib/lftp/4.4.10/proto-http.so
> 76K    output/target/usr/lib/lftp/4.4.10/proto-sftp.so
>
> For my use case, I disable cmd-torrent, and all the proto except ftp (and
> proto-file, which can't be disabled).
> It saves 356Kb. To me it's not a bad score.

  Agreed.

>
> In the Config file I offer the choice to disable/enable everything just
> for the sake of offering every option possible, but I agree that some
> options may be useless.
> For example, cmd-sleep doesn't save much space, compared to the total
> size of lftp.

  If you feel like removing the options that don't make much of a 
difference, please do. But otherwise, you can just leave things as is.

>
> Tell me what you prefer about that. Also, if you prefer to present the
> options in a sub-menu instead of the main menu, or if you think a default
> setting should be set (like enabling ftp by defaut, because the name lftp
> suggests that it deals with ftp...).

  Personally I don't like submenus, but we do have them for some 
packages. So: choose whatever you prefer.

  Enabling ftp by default makes sense but again is not strictly necessary.

[snip]

  Your other replies were satisfactory, so after squashing the two 
patches you'll probably get my Acked-by.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
