From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Sat, 18 Oct 2014 01:02:52 +0200
Subject: [Buildroot] [PATCH v2 6/8] package/mpd: enable support for
	libnfs
In-Reply-To: <544194F5.3090001@mind.be>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>	<1413379134-28918-6-git-send-email-jkrause@posteo.de>
 <20141016114439.6e09d052@free-electrons.com> <543FA48C.8040601@posteo.de>
 <544194F5.3090001@mind.be>
Message-ID: <5441A01C.8080004@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 10/18/2014 12:15 AM, Arnout Vandecappelle wrote:
> On 16/10/14 12:57, J?rg Krause wrote:
>> Dear Thomas Petazzoni,
>>
>> On 10/16/2014 11:44 AM, Thomas Petazzoni wrote:
>>> Dear J?rg Krause,
> [snip]
>>>   *) $(STAGING_DIR)/usr/lib/pkgconfig is already the default search path
>>>      for our pkg-config, so there should be no need to make this tuning.
>>>      Which problem have you seen?
>> Without this mpd configuration check does not find libnfs although it is build
>> successfully.
>>
>>      checking for NFS... no
>>      configure: error: NFS input plugin: libnfs not found
>   Actually, we set PKG_CONFIG_LIBDIR to this directory, and PKG_CONFIG_PATH takes
> precedence over PKG_CONFIG_LIBDIR. I have no idea why we do it that way... But
> it means that if the package sets PKG_CONFIG_PATH to /usr/lib/pkg-config, it
> will override our setting.

You're right! The problem is that in version 1.8.0 of libnfs the 
following is set in libnfs.pc.in:

    -Requires.private: @LIBNFS_PC_REQ_PRIVATE@

This is fixed by an upstream patch after the release 1.8.0:
https://github.com/sahlberg/libnfs/commit/d47c989d886e5398143d43d3b6d25fdf7210cb11

>> Maybe I should do this?:
>>      MPD_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>   That looks better, indeed. Except, it should probably be MPD_CONF_ENV.
>

Not necessary anymore, bumping to version 1.9.5 solved this issue:
http://git.buildroot.net/buildroot/commit/?id=28b163f3162c91afaed1e5c5c59d10d18cfa7dbc

Best regards
J?rg Krause
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141018/e2f9e97a/attachment.html>
