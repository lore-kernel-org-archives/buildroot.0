From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 13:14:36 +0200
Subject: [Buildroot] Sanity check failed with expat package when
 modifying eigen.mk a
In-Reply-To: <AM0PR03MB38264A10275830F5137381EFDC8B0@AM0PR03MB3826.eurprd03.prod.outlook.com>
References: <AM0PR03MB38261EE54F381DDDC976EBEFDC890@AM0PR03MB3826.eurprd03.prod.outlook.com>
 <9a9ed512-7222-05fd-d56f-062931ddd2fb@mind.be>
 <AM0PR03MB38264A10275830F5137381EFDC8B0@AM0PR03MB3826.eurprd03.prod.outlook.com>
Message-ID: <d473bd67-13c3-127d-0a9e-0d6974315b17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 11:55, souileh bhn wrote:
> unfortunately no, I've made a make clean, but it doesn't works.
> 
> I've noticed that when compiling mesa3d, then adding eigen without
> making a make clean, it works fine. However recompiling all doesn't succeed.
> 
> 
> On 21/09/2019 10:43, Arnout Vandecappelle wrote:
>>
>> On 19/09/2019 23:49, souileh bhn wrote:
>>> Hi,
>>>
>>> I've made a change to the eigen.mk file as it is shown here
>>> (https://github.com/souilehbhn/buildroot_SLAM_Platform/commit/83f914093f9ae16e4bbb4c709a8fa3dc236b3cb2),

 Silly me, I should have paid more attention to this change.

 You change the destination directory to STAGING_DIR/usr/include. However,
eigen.mk does

$(RM) -r $(EIGEN_DEST_DIR)

so you end up removing STAGING_DIR/usr/include entirely... This will obviously
break things.

 In fact, there's no need at all for eigen.mk to clean up its installation
directory, so you can just remove that line.


 Regards,
 Arnout


>>> but an error has occurred with the expat 2.2.6 package saying that cpp
>>> fails sanity check.
>>>
>>> configure: error: C preprocessor
>>> "/home/~/buildroot_SLAM_Platform/output/host/bin/arm-linux-gnueabihf-cpp"
>>> fails sanity check
>>>
>>> The buildroot is configured to use linaro toolchain for armhf. I've only
>>> checked mesa3d and eigen. if eigen is not checked the problem doesn't exist.
>>>
>>> I can't find where is the problem exact.
>>  Is it possible that you changed something in your configuration and didn't do a
>> 'make clean' before doing 'make'?
>>
>>  Regards,
>>  Arnout
>>
> 
