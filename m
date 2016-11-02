From: David Lechner <david@lechnology.com>
Date: Wed, 2 Nov 2016 16:49:49 -0500
Subject: [Buildroot] [PATCH] linux/linux-ext-fbtft: remove unnecessary ;
	\
In-Reply-To: <20161102224502.4e5c3d3b@free-electrons.com>
References: <1478121182-17011-1-git-send-email-david@lechnology.com>
 <20161102224502.4e5c3d3b@free-electrons.com>
Message-ID: <1ad5b7ea-91cd-d729-a569-402668443d34@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/2016 04:45 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed,  2 Nov 2016 16:13:02 -0500, David Lechner wrote:
>> The makefile has some unnecessary instances of ; \ at the end of the lines,
>> so remove them to make code a bit more readable.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>  linux/linux-ext-fbtft.mk | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
>> index 5eb3d94..64e65a1 100644
>> --- a/linux/linux-ext-fbtft.mk
>> +++ b/linux/linux-ext-fbtft.mk
>> @@ -13,10 +13,10 @@ define FBTFT_PREPARE_KERNEL
>>  		dest=drivers/video/fbdev ; \
>>  	else \
>>  		dest=drivers/video ; \
>> -	fi ; \
>> -	mkdir -p $(LINUX_DIR)/$${dest}/fbtft; \
>> -	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/ ; \
>> +	fi
>> +	mkdir -p $(LINUX_DIR)/$${dest}/fbtft
>> +	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/
>>  	echo "source \"$${dest}/fbtft/Kconfig\"" \
>> -		>> $(LINUX_DIR)/$${dest}/Kconfig ; \
>> +		>> $(LINUX_DIR)/$${dest}/Kconfig
>
> Did you test this? It won't work. Indeed in this case, you are sharing
> a shell variable between multiple commands, so they must be a single
> shell command.

No I didn't. You made a similar change to one of my EV3 patches. This is 
where I copied the code from, so I thought you could get away with the 
same change here. I missed the bit about the environment variable.


>
> It can however probably be rewritten in make like this:
>
> define FBTFT_PREPARE_KERNEL_INNER
> 	mkdir -p $(LINUX_DIR)/$(1)/fbtft
> 	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$(1)/fbtft/
> 	echo "source \"$(1)/fbtft/Kconfig\"" \
> 		>> $(LINUX_DIR)/$(1)/Kconfig
> 	echo 'obj-y += fbtft/' >> $(LINUX_DIR)/$(1)/Makefile
> endef
>
> define FBTFT_PREPARE_KERNEL
> 	$(if $(wildcard $(LINUX_DIR)/drivers/video/fbdev), \
> 		$(call FBTFT_PREPARE_KERNEL_INNER,drivers/video/fbdev), \
> 		$(call FBTFT_PREPARE_KERNEL_INNER,drivers/video/) \
> 	)
> endef
>
> However, I am not sure it is really more readable.
>

Yes, we can drop this patch. I just wanted to prevent a future 
copy-paste problem like I had, but I guess I will just have to learn 
more about Makefiles instead. ;-)
