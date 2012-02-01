From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 01 Feb 2012 22:38:07 +0100
Subject: [Buildroot] [RFC 03/15] legal-info: save source tarballs for
 all packages
In-Reply-To: <201201312310.06332.arnout@mind.be>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-4-git-send-email-luca@lucaceresoli.net>
 <201201312310.06332.arnout@mind.be>
Message-ID: <4F29B0BF.3080303@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
> On Sunday 29 January 2012 16:11:36 Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>   Darn, I've been adding Reviewed-by tags even though I said I wouldn't :-)
>
> [snip]
>> @@ -633,7 +635,8 @@ endif
>>
>>   clean:
>>   	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>> -		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
>> +		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
>> +		$(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
>   $(REDIST_SOURCES_DIR) is a subdir of $(LEGAL_INFO_DIR), so doesn't need
> to be cleaned twice.

You're right.
Again a remnant of my initial drafts, when the two subdirs ere not one
inside the other...

>
>>
>>   distclean: clean
>>   ifeq ($(DL_DIR),$(TOPDIR)/dl)
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>> index e117223..0d7e081 100644
>> --- a/package/Makefile.package.in
>> +++ b/package/Makefile.package.in
>> @@ -653,10 +653,11 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>>   $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>>   endif
>>
>> -$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR)
>> +$(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
>>   			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
>>   			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
>>   				>>$(LEGAL_MANIFEST_CSV)
>> +			@cp $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR)
>
>   Actually, for local and override packages (of which you said they are not
> supported at the moment), $(1)-source should create a tar file.

Yes, this is another point in my TODO list. I have a few implementation
options to choose from.

Luca
