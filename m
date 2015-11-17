From: Peter Rosin <peda@lysator.liu.se>
Date: Tue, 17 Nov 2015 22:36:03 +0100
Subject: [Buildroot] [PATCH] pkg-generic: Strip all but leading comments
 from C files used as license.
In-Reply-To: <20151117221622.6443362f@free-electrons.com>
References: <1447779739-4661-1-git-send-email-peda@lysator.liu.se>
 <20151117221622.6443362f@free-electrons.com>
Message-ID: <564B9DC3.8070703@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2015-11-17 22:16, Thomas Petazzoni wrote:
> Dear Peter Rosin,
>
> On Tue, 17 Nov 2015 18:02:19 +0100, Peter Rosin wrote:
>> From: Peter Rosin <peda@axentia.se>
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
> Thanks for your contribution. Could you explain what is the problem
> with keeping a complete source file as legal information?

It's not a big deal, but source code certainly looked out of place
when I first scanned through licenses.txt. I guess you old-timers
have just gotten used to having it there...

>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 44bd2c9..1497eb2 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -145,8 +145,30 @@ endef
>>  
>>  define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
>>  	$(call legal-license-header,$(1),$(2) file,$(4)) && \
>> -	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
>> -	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
>>  	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
>> -	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
>> +	case $(3) in \
>> +	*.c|*.h) \
>> +	  sed -e '\
>> +x;\
>> +/^$$/{\
>> +  x;\
>> +  /^[ \t]*$$/b;\
>> +  /^[ \t]*\/\//b;\
>> +  /^[ \t]*\/\*.*\*\//b;\
>> +  /^[ \t]*\/\*/h;\
>> +  //b;\
>> +  s/.*//;\
>> +  q\
>> +};\
>> +x;\
>> +/\*\//{\
>> +  x;\
>> +  s/.*//;\
>> +  x\
>> +}' < $(3) > $(LICENSE_FILES_DIR_$(4))/$(1)/$(2) \
> We quickly discussed your proposal on the #buildroot IRC, and the
> conclusion is that we generally don't like this, for at least two
> reasons:
>
>  1/ The sed expression is awfully complicated.
>
>  2/ There is absolutely no guarantee that the license part is inside
>     the leading comment and that the complicated sed expression will
>     actually keep the relevant part of the file.
>
> We generally try to use a fairly short source code file as the license
> text, so that keeping the entire file should not be a problem. If it
> remains a problem, then I would suggest that you work with the upstream
> project and ask them to include a separate license file that we can use.

I wouldn't call it a sed expression, it's a sed program really, but it's not very
complicated once you get through the sed syntax. But I see your points. I
just had a bit of fun writing it, no big deal if it gets thrown away here. I'll just
run the same thing locally instead...

> Another possibility would be to do something like:
>
> <pkg>_LICENSE_FILES = foo.c-23+42
>
> to indicate that the license text is from line 23 to line 42. But it is
> again not very foolproof, and it doesn't give much benefits.
>
Right, and that approach would require more care on version bumps...

Cheers,
Peter
