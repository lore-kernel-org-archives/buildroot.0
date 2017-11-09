From: Chu, Zhuliang (NSB - CN/Shanghai) <zhuliang.chu@nokia-sbell.com>
Date: Thu, 9 Nov 2017 04:32:54 +0000
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171107181307.58471ad9@windsurf>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>,
 <20171107181307.58471ad9@windsurf>
Message-ID: <5DBA847110A28B46BBA17BE675F0C9B2181AA3EE@cnshjmbx01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas Petazzoni, All,

>Hello,
>
>On Tue, 7 Nov 2017 11:48:17 +0000, Chu, Zhuliang (NSB - CN/Shanghai)
>wrote:
>
>> I have seen your mail on the buildroot mailing list.
>> I download your buildroot branch 'ppsh' and test it with my configurations.
>
>First of all, thanks a lot for taking the time to test my patches and reporting the issues. It is very, very useful feedback, so many thanks!
>
>Unfortunately, your e-mail was too large to make it to the mailing list, due to the huge attached file you had. Next time, it would be better if you could upload the log file somewhere, and just give a link in your e-mail.
>
>See below my replies for the different issues your report.

I am still researching your patch series and testing it in my free time. So my reply may be a little delay.
Today I will report 2 problems to you from my testing.


I very much appreciate your efforts on the `per-package`. I think it will become a good solution to solve the problem of parallel compilation buildroot. Thanks Thomas.

About previous Q1: Compatibility Issues
>> 
>> in mainstream buildroot, the order of package A is before openssl. So openssl is always support A.
>> but in 'ppsh', openssl is always not support A. if once 'ppsh' is merged into the mainstream, there will cause software inconsistencies.
>
>I don't understand this problem. Which "package A" are you referring to ?
> Could you describe in more details the problem you're seeing?

Sorry my introduction is too simple to cause ambiguity in my first email.
This issue is only my worries but don`t be verified in my test.

My worries:
When I am a customer, I always use current buildroot. 
In current buildroot, the build order guarantee is very import and the order is determined after many times of testing by customer.
Example package 'A', it is not explicitly expressed in openssl`s .mk file. But in current build order, 'A' is before openssl. So in the configuring step of openssl,the openssl will check that 'A' has been installed. So I am sure that the final result is the openssl support 'A'.
If per-package gets to the point where it can be merged and it will be pushed into buildroot mainstream. In customers, they will find the buildroot can be parallel compilation now. They will be very happy to use this feature. So they will use `make -j8` instead of 'make -j1'. If they don`t explicitly describe the dependency 'A' in openssl`s .mk file. And now the openssl don`t support 'A'. But this is not expected behavior for customer.
Yes, if the customer know the situation 'A', it is simple. He will explicitly express in openssl .mk file. But if he don`t know, what would he do?
We know that there are a lot of unconspicuous dependencies in current buildroot and this is also why buildroot can't be parallel compilation now.

So the intention I put forward the question is that promoting the community to provide a method to help the current buildroot smooth transition to the per-package when the per-package is pushed into the buildroot mainstream.
So I said this will cause software inconsistencies in future in previous email.

About previous Q2: Space Expension
>Which tool (and options) have you used to calculate this size?
>
Only use linux simple command:  du --max-depth=1 -h

>Indeed, we are using hardlinks, so files are not duplicated. Only files that are overwritten get de-duplicated.
> Could you investigate this a bit more, checking first if the tool you use to calculate the size properly accounts for hard links ?
Sorry Thomas, this problem is likely to be one of my mistake rather than 'per-package'.
This is also associated with the problem which I will report. I will explain there.

About previous Q3/Q4, I will reply in another email.

Now I report 2 problems from my testing or consider.

Q1: rsync conflicts
I want to generate this conflicts in testing but this is difficult. So this is also only my worries.
At the same time in parallel compilation, different threads want to modify the same file of a package in different per-package/package directory and modify the content isn`t the same.
This will generate conflicts. How to solve this problem?
I.E. thread t1 modify file A in per-package/package/A, t1 want to modify A content from 'TEXT' to 'EXIT'. At the same time, thread t2 also modify A content from 'TEXT' to 'TXXT'. And I think rsync has enough power to handle such parallel changes in this situation. but after the successful modify there is still problem. for example, rsync make the content as 'TXXT' and this result is suitable thread t2. But the thread t1 wants to 'EXIT'. 
I know this probability is minimal. But what should we do if such a conflict arises?

Q2: toolchain HOST_DIR
I use  external custom toolchain. 'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y'
line 66 of pkg-toolchain-external.mk66 in toolchain/toolchain-external/ is 'TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain '.
this $(HOST_DIR) is also 'output/host/' rather than 'output/per-package/....'. 


Chu,Zhuliang
Best regards,
