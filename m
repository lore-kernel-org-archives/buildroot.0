From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 26 Mar 2018 11:10:32 -0700
Subject: [Buildroot] [PATCH] sam-ba: use correct host arch binary for
 sam-ba symlink
In-Reply-To: <20180325222519.2d36d2f4@windsurf>
References: <1521735866-15288-1-git-send-email-joshua.henderson@microchip.com>
 <20180325222519.2d36d2f4@windsurf>
Message-ID: <689868d9-5d05-6fac-f186-c891a1cba705@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alexandre,

On 03/25/2018 01:25 PM, Thomas Petazzoni wrote:
> Hello Joshua,
> 
> On Thu, 22 Mar 2018 09:24:26 -0700, Joshua Henderson wrote:
>> Make the symlink created in the host/bin directory point to the right host arch
>> binary.  This takes into account using the 32 bit or 64 bit binary.
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> ---
>>  package/sam-ba/sam-ba.mk | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> In fact, your commit does much more than fixing the sam-ba symlink
> depending on the host architecture: the sam-ba symlink was *always*
> broken. Indeed, you're changing this:
> 
> -	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
> +	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba
> 
> I.e you're removing one level of ../ when creating the relative
> symlink. And this is needed since we moved $(HOST_DIR)/usr to
> $(HOST_DIR).
> 
> So even on a x86 32 bit system, where the binary is named "sam-ba",
> your commit fixes the symbolic link. I've reworded the commit log
> accordingly, and applied your patch. Thanks!

That is correct.  Thank you for clarifying.

> 
> Peter: this commit qualifies for 2018.02.x.
> 
> Joshua: what about updating to 2.17, or even Sam-ba 3.x ?

I have something in this direction in progress.  I just have to finish up reconciling the update to sam-ba 3.x with things like board/atmel/flasher.sh.  I'm not sure what that means yet.  Should flasher.sh stick around?

Josh
