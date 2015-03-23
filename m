From: Arthur Lambert <lambertarthur22@gmail.com>
Date: Mon, 23 Mar 2015 11:05:50 +0100
Subject: [Buildroot] Running hdf5 on ARM target
Message-ID: <CAGpqJgrDfmzUmzGLY=tpdEGB2rgU7JYjvXVReZWpRESW9Lrsrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found some patches which allow to cross compile and install hdf5
with buildroot on ARM target. I found patches here :
https://patchwork.ozlabs.org/patch/425217/
I am able to compile hdf5 but I am not able to run software which
using hdf5 with success.

simple test :
**************************************************
# include <hdf5.h>
# include <hdf5_hl.h>

int main(void)
{
hid_t file = H5Fcreate("/tmp/test.h5", H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
H5Fclose (file);

return 0;
}
**************************************************

Result :

***********************************************
HDF5-DIAG: Error detected in HDF5 (1.8.14) thread 0:
  #000: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #001: H5Tconv.c line 7726 in H5T__conv_long_float(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #002: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #003: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #004: H5Tconv.c line 7700 in H5T__conv_uint_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #005: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #006: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #007: H5Tconv.c line 7623 in H5T__conv_int_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #008: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #009: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #010: H5Tconv.c line 7546 in H5T__conv_ushort_ldouble():
disagreement about datatype size
    major: Datatype
    minor: Unable to initialize object
  #011: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #012: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #013: H5Tconv.c line 7469 in H5T__conv_short_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #014: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #015: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #016: H5Tconv.c line 7392 in H5T__conv_uchar_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #017: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #018: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #019: H5Tconv.c line 7315 in H5T__conv_schar_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #020: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #021: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #022: H5Tconv.c line 7238 in H5T__conv_ldouble_double():
disagreement about datatype size
    major: Datatype
    minor: Unable to initialize object
  #023: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #024: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #025: H5Tconv.c line 7211 in H5T__conv_ldouble_float(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
  #026: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #027: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #028: H5Tconv.c line 7184 in H5T__conv_double_ldouble():
disagreement about datatype size
    major: Datatype
    minor: Unable to initialize object
  #029: H5T.c line 2337 in H5T_register(): unable to locate/allocate
conversion path
    major: Datatype
    minor: Unable to initialize object
  #030: H5T.c line 4492 in H5T_path_find(): unable to initialize
conversion function
    major: Datatype
    minor: Unable to initialize object
  #031: H5Tconv.c line 7123 in H5T__conv_float_ldouble(): disagreement
about datatype size
    major: Datatype
    minor: Unable to initialize object
test2
HDF5-DIAG: Error detected in HDF5 (1.8.14) thread 0:
  #000: H5F.c line 774 in H5Fclose(): not a file ID
    major: Invalid arguments to routine
    minor: Inappropriate type
test3
./test_h5: H5Eint.c: 719: H5E_printf_stack: Assertion `cls_id > 0' failed.
Aborted
***********************************************

Someone here was able to run hdf5  on ARM target thanks to these patches ?

Thanks,
Arthur.
