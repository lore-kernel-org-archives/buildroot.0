From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 Jul 2018 12:37:35 +0300
Subject: [Buildroot] [PATCH] vim: create a relative symlink for vi
In-Reply-To: <e0e52f37-0591-115a-8f20-02eb0242d938@mind.be>
References: <702cfdddc48676d80838097f4e871f6cf797a412.1531465580.git.baruch@tkos.co.il>
 <e0e52f37-0591-115a-8f20-02eb0242d938@mind.be>
Message-ID: <87r2k7fpcw.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle writes:
> On 13-07-18 09:06, Baruch Siach wrote:
>> /bin/vi is created as a canonical symlink, which might be dangling when
>> the host doesn't have vim installed. This is not a problem by itself.
>> But since commit 50dc350c65f4 (package/busybox: update to 1.29.0) we use
>> noclobber install of busybox. The dangling symlink is interpreted as non
>> existing file, which breaks the noclobber install.
>> 
>> Fixes:
>> http://autobuild.buildroot.net/results/796/796107430db6545401d9926e84f19eaf2040b756/
>> 
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> Yann, in the general case we should probably not copy over a dangling
>> symlink. So maybe we need to account for that in the install.sh script
>> of busybox.
>> ---
>>  package/vim/vim.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
>> index dbf71c573f6c..4a8bbdad2e1e 100644
>> --- a/package/vim/vim.mk
>> +++ b/package/vim/vim.mk
>> @@ -64,7 +64,7 @@ endef
>>  
>>  # Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
>>  define VIM_INSTALL_VI_SYMLINK
>> -	ln -sf /usr/bin/vim $(TARGET_DIR)/bin/vi
>> +	ln -sf ../usr/bin/vim $(TARGET_DIR)/bin/vi
>
>  Won't this break under BR2_ROOTFS_MERGED_USR?
>
>  That's a problem with relative symlinks in general: the .. may not point to the
> directory you expect...

So the real fix requires a change to the busybox install.sh, right?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
