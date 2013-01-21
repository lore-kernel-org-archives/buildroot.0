From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 21 Jan 2013 19:14:05 +0100
Subject: [Buildroot] [PATCH] vsftpd: install sample config file to /etc
In-Reply-To: <50FA748B.903@mind.be>
References: <1358328248-15016-1-git-send-email-sho@relinux.de>
 <50FA748B.903@mind.be>
Message-ID: <50FD856D.3020002@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.01.2013 11:25, schrieb Arnout Vandecappelle:
> On 16/01/13 10:24, Stephan Hoffmann wrote:
>> vsftpd comes with a sample config file that can serve as a starting
>> point for customization and enables a basic functionality. Since
>> this config refers to a directory "/usr/share/empty" this is also
>> created.
>
>  I think the point of /usr/share/empty is that it's a directory that
> doesn't exist, so vsftpd will not allow any up/download unless you
> change the configuration file.
Arnout, Peter,

I checked this. Obviously, vsftpd uses this directory to chroot there.
If it isn't present it refuses to work:
> 500 OOPS: vsftpd: not found: directory given in
> 'secure_chroot_dir':/usr/share/empty
At least I admit that my commit message was misleading. So I'll send a
patch to add this;-)

>  I think it's a bad idea to default giving access to some random
> location - even if it is read-only non-anonymous access to an empty
> directory.
That is not the case. Default configuration allows anonymous login, but
shows empty directory without write access.

Kind regards

Stephan
>
>  But that's just my opinion.
>
>  Regards,
>  Arnout
>
>>
>> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
>> ---
>>   package/vsftpd/vsftpd.mk |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
>> index ca711bb..f694b87 100644
>> --- a/package/vsftpd/vsftpd.mk
>> +++ b/package/vsftpd/vsftpd.mk
>> @@ -37,6 +37,10 @@ define VSFTPD_INSTALL_TARGET_CMDS
>>       test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
>>           $(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
>>               $(TARGET_DIR)/etc/init.d/S70vsftpd
>> +    test -f $(TARGET_DIR)/etc/vsftpd.conf || \
>> +        $(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
>> +            $(TARGET_DIR)/etc/vsftpd.conf
>> +    $(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/empty
>>   endef
>>
>>   define VSFTPD_UNINSTALL_TARGET_CMDS
>
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
